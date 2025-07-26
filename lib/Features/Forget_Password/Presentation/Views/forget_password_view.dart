import 'package:e_commerce_app/Core/navigate.dart';
import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/myElevated_button.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/row_of_dont_have_an_account_and_sign_up.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/text_of_title_and_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  String? email;
  final GlobalKey<FormState> myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: myKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Opacity(opacity: .5, child: Text('Forgot Password')),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextOfTitleAndSubtitle(
                    title: 'Forgot Password',
                    subtitle:
                        'please enter your email and we will send \n you a link to return to your account'),
                SizedBox(
                  height: 70,
                ),
                MyTextField(
                  myTextLabel: 'Email',
                  myHintText: 'Enter your email',
                  myIcon: Icon(Icons.mail),
                  onChanged: (Value) {
                    email = Value;
                  },
                ),
                SizedBox(
                  height: 110,
                ),
                MyelevatedButton(
                  onPressed: () async {
                    if (myKey.currentState!.validate()) {
                      myKey.currentState!.save();

                      try {
                        final credential = await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Password Reset Email Sent Successfully, please check your email and login with your new password.'),
                          ),
                        );
                        GoRouter.of(context).pop();
                      } on FirebaseAuthException catch (e) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(e.message.toString()),
                            );
                          },
                        );
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 70,
                ),
                RowOfDontHaveAnAccountAndSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
