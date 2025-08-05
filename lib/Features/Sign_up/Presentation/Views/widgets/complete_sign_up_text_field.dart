import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:e_commerce_app/Features/Sign_up/Data/Models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

final user = <String, dynamic>{
  "First Name": firstname,
  "Last Name": lastname,
  "Phone Number": phonenumber,
  "Address": address,
};
List<SignUpModel> SignUpModelList = [
  SignUpModel(
    myTextLabel: 'First Name',
    myHintText: 'Enter your first name',
    myIcon: Icon(Icons.person),
    onChanged: (value) {
      firstname = value;
    },
  ),
  SignUpModel(
    myTextLabel: 'Last Name',
    myHintText: 'Enter your last name',
    myIcon: Icon(Icons.person),
    onChanged: (value) {
      lastname = value;
    },
  ),
  SignUpModel(
    myTextLabel: 'Phone Number',
    myHintText: 'Enter your phone number',
    myIcon: Icon(Icons.mobile_friendly),
    onChanged: (value) {
      phonenumber = int.parse(value);
    },
  ),
  SignUpModel(
    myTextLabel: 'Address',
    myHintText: 'Enter your address',
    myIcon: Icon(Icons.location_on_outlined),
    onChanged: (value) {
      address = value;
    },
  )
];

class _CompleteSignUpTextFieldState extends State<CompleteSignUpTextField> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

// Add a new document with a generated ID
    firestore.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));

    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return MyTextField(
            SignUpModelObject: SignUpModelList[index],
          );
        },
      ),
    );
  }
}
