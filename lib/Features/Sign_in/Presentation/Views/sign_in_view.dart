import 'package:e_commerce_app/Core/navigate.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/myElevated_button.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/row_of_check_box_and_text_button.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/row_of_dont_have_an_account_and_sign_up.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/row_of_social_media_logos.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/text_fields_of_email_and_password.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/text_of_title_and_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> myKey = GlobalKey();
  String? email;
  String? Password;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: myKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Opacity(opacity: .5, child: Text('Sign In')),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextOfTitleAndSubtitle(
                  title: 'Welcome',
                  subtitle:
                      'Sign in with your email and password \n or continue with social media',
                ),
                SizedBox(height: 40),
                TextFieldsOfEmailAndPassword(
                  onChangedForEmail: (value) {
                    email = value;
                  },
                  onChangedForPassword: (value) {
                    Password = value;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                RowOfCheckBoxAndTextButton(
                  value: isSelected,
                  onChanged: (thing) {
                    setState(() {
                      isSelected = thing!;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                MyelevatedButton(onPressed: () async {
                  if (myKey.currentState!.validate()) {
                    myKey.currentState!.save();
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email!,
                        password: Password!,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Sign in successfully'),
                        ),
                      );

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      if (isSelected) {
                        await prefs.setBool('isRemembered', true);
                      }

                      GoRouter.of(context).go(Navigate.KHomePage);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No user found for that email.'),
                          ),
                        );
                      } else if (e.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Wrong password provided for that user.'),
                          ),
                        );
                      }
                    }
                  }
                }),
                SizedBox(
                  height: 40,
                ),
                RowOfSocialMediaLogos(),
                SizedBox(
                  height: 10,
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
