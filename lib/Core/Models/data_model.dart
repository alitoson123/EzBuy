import 'package:firebase_auth/firebase_auth.dart';

class DataModel {
  String Fname;
  String Lname;
  int PhoneNumber;
  String Address;

  DataModel({
    required this.Fname,
    required this.Lname,
    required this.PhoneNumber,
    required this.Address,
  });

  Map<String, dynamic> toMap() => {
        'Fname': Fname,
        'Lname': Lname,
        'PhoneNumber': PhoneNumber,
        'Address': Address,
      };
}
