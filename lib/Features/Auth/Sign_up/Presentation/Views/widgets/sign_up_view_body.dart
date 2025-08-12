import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/row_of_social_media_logos.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/text_fields_of_email_and_password.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/text_of_title_and_subtitle.dart';
import 'package:e_commerce_app/Features/Auth/Sign_up/Data/Models/sign_up_model.dart';
import 'package:e_commerce_app/Features/Auth/Sign_up/Presentation/view_model/Sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/myElevated_button.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> myKey = GlobalKey();
  String? email;
  String? Password;
  String? confirmPassword;
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
                SignUpModelObject: SignUpModel(
                  myTextLabel: 'Confirm Password',
                  myHintText: 'Re-enter your password',
                  myIcon: Icon(Icons.lock),
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              MyelevatedButton(
                onPressed: () async {
                  if (myKey.currentState!.validate()) {
                    myKey.currentState!.save();
                  await  BlocProvider.of<SignUpCubit>(context).signUpMethod(context,
                        email: email!,
                        password: Password!,
                        isSelected: true);
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
    );
  }
}
