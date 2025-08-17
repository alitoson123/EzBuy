class UserEntity {
  final String email;
  final String name;
  final String useruid;

  UserEntity(
      {required this.email,
      required this.name,
      required this.useruid});

  Map<String, dynamic> toMap() => {
        'email': email,
        'name': name,
        'useruid': useruid,
      };
}
