import 'package:e_commerce_app/Core/Models/data_model.dart';
import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:e_commerce_app/Features/Auth/Sign_up/Data/Models/sign_up_model.dart';
import 'package:flutter/material.dart';

class CompleteSignUpTextField extends StatefulWidget {
  const CompleteSignUpTextField({
    super.key,
  });

  @override
  State<CompleteSignUpTextField> createState() =>
      _CompleteSignUpTextFieldState();
}

class _CompleteSignUpTextFieldState extends State<CompleteSignUpTextField> {
  late DataModel userModelObject;
  late List<SignUpModel> SignUpModelList;

  @override
  void initState() {
    super.initState();
    userModelObject = DataModel(
        Fname: '', Lname: '', PhoneNumber: 0, Address: '', userId: '');
    SignUpModelList = [
      SignUpModel(
        keyboardType: TextInputType.name,
        myTextLabel: 'First Name',
        myHintText: 'Enter your first name',
        myIcon: Icon(Icons.person),
        onChanged: (value) {
          userModelObject.Fname = value;
        },
      ),
      SignUpModel(
        keyboardType: TextInputType.name,
        myTextLabel: 'Last Name',
        myHintText: 'Enter your last name',
        myIcon: Icon(Icons.person),
        onChanged: (value) {
          userModelObject.Lname = value;
        },
      ),
      SignUpModel(
        keyboardType: TextInputType.phone,
        myTextLabel: 'Phone Number',
        myHintText: 'Enter your phone number',
        myIcon: Icon(Icons.mobile_friendly),
        onChanged: (value) {
          userModelObject.PhoneNumber = int.parse(value);
        },
      ),
      SignUpModel(
        keyboardType: TextInputType.streetAddress,
        myTextLabel: 'Address',
        myHintText: 'Enter your address',
        myIcon: Icon(Icons.location_on_outlined),
        onChanged: (value) {
          userModelObject.Address = value;
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
