import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/myElevated_button.dart';
import 'package:e_commerce_app/Features/Sign_up/Presentation/Views/widgets/complete_sign_up_text_field.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Opacity(opacity: .5, child: Text('My Account')),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc('bsEL1XsnrqEzDDn3v9zh').get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: SignUpModelList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextField(
                            initialValue: snapshot
                                .data![SignUpModelList[index].myTextLabel]
                                .toString(),
                            SignUpModelObject: SignUpModelList[index],
                          ),
                        );
                      },
                    ),
                  ),

                  /* TextFormField(
                    initialValue: snapshot.data!['First Name'],
                    decoration: InputDecoration(
                      //    labelText: myTextLabel,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      floatingLabelStyle: TextStyle(color: KPrimaryColor),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                      //   suffixIcon: myIcon,
                      //   hintText: myHintText,
                      focusedBorder: focusOutLineInputBorder(),
                      border: borderOutLineInputBorder(),
                    ),
                  ),*/
                  MyelevatedButton(text: 'Update', onPressed: () {}),
                ],
              ),
            );
          }
          return Text("loading");
        },
      ),
    );
  }

  OutlineInputBorder borderOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    );
  }

  OutlineInputBorder focusOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.black),
    );
  }
}
