import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:e_commerce_app/Features/Auth/Forget_Password/Presentation/view_model/Forget_password_cubit/forget_password_cubit.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/row_of_dont_have_an_account_and_sign_up.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/text_of_title_and_subtitle.dart';
import 'package:e_commerce_app/Features/Auth/Sign_up/Data/Models/sign_up_model.dart';
import 'package:e_commerce_app/Core/widgets/myElevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  String? email;
  final GlobalKey<FormState> myKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: myKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
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
                SignUpModelObject: SignUpModel(
                  myTextLabel: 'Email',
                  myHintText: 'Enter your email',
                  myIcon: Icon(Icons.mail),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              SizedBox(
                height: 110,
              ),
              MyelevatedButton(
                onPressed: () async {
                  if (myKey.currentState!.validate()) {
                    myKey.currentState!.save();

                    await BlocProvider.of<ForgetPasswordCubit>(context)
                        .ForgetPasswordCubitMethod(email: email!);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
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
    );
  }
}
