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
      this.imageUrl});
}
