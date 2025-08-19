import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:e_commerce_app/Features/Auth/Data/models/user_model.dart';
import 'package:e_commerce_app/Features/Auth/Sign_up/Data/Models/sign_up_model.dart';
import 'package:flutter/material.dart';

class CompleteSignUpTextField extends StatefulWidget {
  const CompleteSignUpTextField({
    super.key, required this.userModelObject,
  });
  final UserModel userModelObject;


  @override
  State<CompleteSignUpTextField> createState() =>
      _CompleteSignUpTextFieldState();
}

class _CompleteSignUpTextFieldState extends State<CompleteSignUpTextField> {
  late List<SignUpModel> SignUpModelList;

  @override
  void initState() {
    super.initState();
   
    SignUpModelList = [
      SignUpModel(
        keyboardType: TextInputType.name,
        myTextLabel: 'First Name',
        myHintText: 'Enter your first name',
        myIcon: Icon(Icons.person),
        onChanged: (value) {
          widget.userModelObject.Fname = value;
        },
      ),
      SignUpModel(
        keyboardType: TextInputType.name,
        myTextLabel: 'Last Name',
        myHintText: 'Enter your last name',
        myIcon: Icon(Icons.person),
        onChanged: (value) {
          widget.userModelObject.Lname = value;
        },
      ),
      SignUpModel(
        keyboardType: TextInputType.phone,
        myTextLabel: 'Phone Number',
        myHintText: 'Enter your phone number',
        myIcon: Icon(Icons.mobile_friendly),
        onChanged: (value) {
          widget.userModelObject.phoneNumber = int.parse(value);
        },
      ),
      SignUpModel(
        keyboardType: TextInputType.streetAddress,
        myTextLabel: 'Address',
        myHintText: 'Enter your address',
        myIcon: Icon(Icons.location_on_outlined),
        onChanged: (value) {
          widget.userModelObject.address = value;
        },
      )
    ];
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: SignUpModelList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: MyTextField(
            SignUpModelObject: SignUpModelList[index],
          ),
        );
      },
    );
  }
}
