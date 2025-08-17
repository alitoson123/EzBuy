class UserEntity {
  String? Fname;
  String? Lname;
  int? phoneNumber;
  String? address; 
  final String email;
  final String useruid;

  UserEntity({required this.email, required this.useruid, this.Fname, this.Lname, this.phoneNumber, this.address});

  Map<String, dynamic> toMap() => {
        'email': email,
        'useruid': useruid,
      };

  Map<String, dynamic> toMap2() => {
        'Fname': Fname,
        'Lname': Lname,
        'PhoneNumber': phoneNumber,
        'Address': address,
        'email': email,
        'useruid': useruid,
      };
      
}
