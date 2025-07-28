import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class CompleteSignUpTextField extends StatefulWidget {
  const CompleteSignUpTextField({
    super.key,
  });

  @override
  State<CompleteSignUpTextField> createState() =>
      _CompleteSignUpTextFieldState();
}

String firstname = '';
String lastname = '';
int phonenumber = 0;
String address = '';

class _CompleteSignUpTextFieldState extends State<CompleteSignUpTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        MyTextField(
          myTextLabel: 'First Name',
          myHintText: 'Enter your first name',
          myIcon: Icon(Icons.person),
          onChanged: (value) {
            firstname = value;
          },
        ),
        SizedBox(height: 30),
        MyTextField(
          myTextLabel: 'Last Name',
          myHintText: 'Enter your last name',
          myIcon: Icon(Icons.person),
          onChanged: (value) {
            lastname = value;
          },
        ),
        SizedBox(height: 30),
        MyTextField(
          myTextLabel: 'Phone Number',
          myHintText: 'Enter your phone number',
          myIcon: Icon(Icons.mobile_friendly),
          onChanged: (value) {
            phonenumber = int.parse(value);
          },
        ),
        SizedBox(height: 30),
        MyTextField(
          myTextLabel: 'Address',
          myHintText: 'Enter your address',
          myIcon: Icon(Icons.location_on_outlined),
          onChanged: (value) {
            address = value;
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
