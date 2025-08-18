class UserEntity {
  String? Fname;
  String? Lname;
  int? phoneNumber;
  String? address;
  String? email;
  String? useruid;

  UserEntity(
      {this.email,
      this.useruid,
      this.Fname,
      this.Lname,
      this.phoneNumber,
      this.address});

  Map<String, dynamic> toMapOfSignUp() => {
        'email': email,
        'useruid': useruid,
      };
  Map<String, dynamic> toMapOfCompSignUp() => {
        'Fname': Fname,
        'Lname': Lname,
        'PhoneNumber': phoneNumber,
        'Address': address,
      };
  Map<String, dynamic> toMapOfSignInWithGoogleAnFacebook() => {
        'email': email,
        'useruid': useruid,
        'Fname': Fname,
        'Lname': Lname,
        'PhoneNumber': phoneNumber,
        'Address': address,
      };
}
