import 'package:e_commerce_app/Features/Auth/Domain/Entities/user_entity.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/text_button_of_forget_password.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/row_of_dont_have_an_account_and_sign_up.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/row_of_social_media_logos.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/text_fields_of_email_and_password.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/text_of_title_and_subtitle.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce_app/Core/widgets/myElevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({
    super.key,
  });

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  UserEntity? userEntityObject;
  String? email;
  String? Password;
  GlobalKey<FormState> myKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Form(
          key: myKey,
          autovalidateMode: autovalidateMode,
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
                height: 15,
              ),
              TextButtonOfForgetPassword(),
              SizedBox(
                height: 15,
              ),
              MyelevatedButton(
                onPressed: () async {
                  if (myKey.currentState!.validate()) {
                    myKey.currentState!.save();

                    BlocProvider.of<SignInCubit>(context)
                        .signInWithEmailAndPasswordMethod(
                      email: email!,
                      password: Password!,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
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
              RowOfDontHaveAnAccountAndSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
