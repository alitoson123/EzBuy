import 'package:e_commerce_app/Features/Auth/Sign_up/Data/Models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce_app/Core/widgets/my_text_field.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/myElevated_button.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  late List<SignUpModel> signUpModelList;

  @override
  void initState() {
    super.initState();
    signUpModelList = [
      SignUpModel(
        myTextLabel: 'First Name',
        myHintText: 'Enter your first name',
        myIcon: const Icon(Icons.person),
      ),
      SignUpModel(
        myTextLabel: 'Last Name',
        myHintText: 'Enter your last name',
        myIcon: const Icon(Icons.person),
      ),
      SignUpModel(
        myTextLabel: 'Phone Number',
        myHintText: 'Enter your phone number',
        myIcon: const Icon(Icons.mobile_friendly),
      ),
      SignUpModel(
        myTextLabel: 'Address',
        myHintText: 'Enter your address',
        myIcon: const Icon(Icons.location_on_outlined),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Opacity(opacity: .5, child: Text('My Account')),
        backgroundColor: Colors.white,
      ),
      body: currentUser == null
          ? const Center(child: Text("User not signed in"))
          : FutureBuilder<DocumentSnapshot>(
              future: users.doc(currentUser.uid).get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.blue));
                }
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return const Center(child: Text("Document does not exist"));
                }

                final userData = snapshot.data!.data() as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: signUpModelList.length,
                          itemBuilder: (context, index) {
                            final label = signUpModelList[index].myTextLabel;
                            final fieldValue = userData[label] ?? '';
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyTextField(
                                initialValue: fieldValue.toString(),
                                SignUpModelObject: signUpModelList[index],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      MyelevatedButton(
                        text: 'Update',
                        onPressed: () {
                          // TODO: Implement update logic
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
