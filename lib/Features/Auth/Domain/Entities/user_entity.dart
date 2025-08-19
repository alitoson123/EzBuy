class UserEntity {
  String? Fname;
  String? Lname;
  int? phoneNumber;
  String? address;
  String? email;
  String? useruid;
  String? imageUrl;

  UserEntity(
      {this.email,
      this.useruid,
      this.Fname,
      this.Lname,
      this.phoneNumber,
      this.address,
      this.imageUrl
      });

  Map<String, dynamic> toMapOfSignUp() => {
        'email': email,
        'useruid': useruid,
      };
  Map<String, dynamic> toMapOfCompSignUp() => {
        'Fname': Fname,
        'Lname': Lname,
        'PhoneNumber': phoneNumber,
        'Address': address,
        'imageUrl': imageUrl,
      };
  Map<String, dynamic> toMapOfSignInWithGoogleAnFacebook() => {
        'email': email,
        'useruid': useruid,
        'Fname': Fname,
        'Lname': Lname,
        'PhoneNumber': phoneNumber,
        'Address': address,
        'imageUrl': imageUrl,
      };
}
