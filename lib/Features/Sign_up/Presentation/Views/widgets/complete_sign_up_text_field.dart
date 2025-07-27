import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class CompleteSignUpTextField extends StatefulWidget {
  CompleteSignUpTextField(
      {super.key,
      required this.firstname,
      required this.lastname,
      required this.phonenumber,
      required this.address});
  String firstname;
  String lastname;
  int phonenumber;
  String address;

  @override
  State<CompleteSignUpTextField> createState() =>
      _CompleteSignUpTextFieldState();
}

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
            widget.firstname = value;
          },
        ),
        SizedBox(height: 30),
        MyTextField(
          myTextLabel: 'Last Name',
          myHintText: 'Enter your last name',
          myIcon: Icon(Icons.person),
          onChanged: (value) {
            widget.lastname = value;
          },
        ),
        SizedBox(height: 30),
        MyTextField(
          myTextLabel: 'Phone Number',
          myHintText: 'Enter your phone number',
          myIcon: Icon(Icons.mobile_friendly),
          onChanged: (value) {
            widget.phonenumber = int.parse(value);
          },
        ),
        SizedBox(height: 30),
        MyTextField(
          myTextLabel: 'Address',
          myHintText: 'Enter your address',
          myIcon: Icon(Icons.location_on_outlined),
          onChanged: (value) {
            widget.address = value;
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
