import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:e_commerce_app/Features/Auth/Sign_up/Data/Models/sign_up_model.dart';
import 'package:flutter/material.dart';

class TextFieldsOfEmailAndPassword extends StatelessWidget {
  const TextFieldsOfEmailAndPassword({
    super.key,
    required this.onChangedForEmail,
    required this.onChangedForPassword,
  });
  final void Function(String) onChangedForEmail;
  final void Function(String) onChangedForPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(
          SignUpModelObject: SignUpModel(
              myTextLabel: 'Email',
              myHintText: 'Enter your email',
              myIcon: Icon(Icons.mail),
              onChanged: onChangedForEmail),
        ),
        SizedBox(height: 30),
        MyTextField(
          SignUpModelObject: SignUpModel(
              myTextLabel: 'Password',
              myHintText: 'Enter your password',
              myIcon: Icon(Icons.lock),
              onChanged: onChangedForPassword),
        ),
      ],
    );
  }
}
