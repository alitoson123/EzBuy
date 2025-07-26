import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
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
          onChanged: onChangedForEmail,
          myTextLabel: 'Email',
          myHintText: 'Enter your email',
          myIcon: Icon(Icons.mail),
        ),
        SizedBox(height: 30),
        MyTextField(
          onChanged: onChangedForPassword,
          myTextLabel: 'Password',
          myHintText: 'Enter your password',
          myIcon: Icon(Icons.lock),
        ),
      ],
    );
  }
}
