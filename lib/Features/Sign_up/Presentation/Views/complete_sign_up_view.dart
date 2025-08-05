import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Core/messages/message.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/myElevated_button.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/text_of_title_and_subtitle.dart';
import 'package:e_commerce_app/Features/Sign_up/Presentation/Views/widgets/complete_sign_up_text_field.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CompleteSignUpView extends StatefulWidget {
  const CompleteSignUpView({super.key});

  @override
  State<CompleteSignUpView> createState() => _CompleteSignUpViewState();
}

class _CompleteSignUpViewState extends State<CompleteSignUpView> {
  final GlobalKey<FormState> myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: myKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Opacity(opacity: .5, child: Text('Sign Up')),
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
                  title: 'Complete Profile',
                  subtitle:
                      'Complete your details or continue \n with social media',
                ), // shift alt a

                CompleteSignUpTextField(),
                MyelevatedButton(onPressed: () {
                  if (myKey.currentState!.validate()) {
                    myKey.currentState!.save();
                    Message().MessageSuccessMethod(context,
                        message: 'Sign up successfully.');
                    GoRouter.of(context).push(Navigate.KHomePage);
                  }
                }),
                SizedBox(
                  height: 20,
                ),

                Opacity(
                  opacity: .6,
                  child: Text(
                    'By continuing your confirm that you agree \n with our term and condition',
                    textAlign: TextAlign.center,
                    style: Style().textStyle16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
