import 'package:e_commerce_app/Core/Services/Auth/auth.dart';
import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/myElevated_button.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/row_of_social_media_logos.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/text_fields_of_email_and_password.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/text_of_title_and_subtitle.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email;
  String? Password;
  String? confirmPassword;
  GlobalKey<FormState> myKey = GlobalKey();
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
                  title: 'Register Account',
                  subtitle:
                      'Complete your details or continue \n with social media',
                ), // shift alt a
                SizedBox(height: 40),
                TextFieldsOfEmailAndPassword(
                  onChangedForEmail: (value) {
                    email = value;
                  },
                  onChangedForPassword: (value) {
                    Password = value;
                  },
                ),
                SizedBox(height: 30),
                MyTextField(
                  myTextLabel: 'Confirm Password',
                  myHintText: 'Re-enter your password',
                  myIcon: Icon(Icons.lock),
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                MyelevatedButton(
                  onPressed: () async {
                    if (myKey.currentState!.validate()) {
                      myKey.currentState!.save();
                      await Auth().SignUpMethod(context,
                          email: email!,
                          password: Password!,
                          confirmPassword: confirmPassword!,
                          isSelected: true);
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                RowOfSocialMediaLogos(),
                SizedBox(
                  height: 10,
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
