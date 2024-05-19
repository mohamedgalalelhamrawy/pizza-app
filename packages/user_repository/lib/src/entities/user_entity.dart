class UserEntity {
  final String userId;
  final String email;
  final String name;
  final bool hasactivecart;

  UserEntity(
      {required this.userId,
      required this.email,
      required this.name,
      required this.hasactivecart});

  Map<String, dynamic> toDocument() {
    return {
      "userId": userId,
      "email": email,
      "name": name,
      "hasactivecart": hasactivecart,
    };
  }

  UserEntity fromDocument(Map<String, dynamic> doc) {
    return UserEntity(
        userId: doc["userId"],
        email: doc["email"],
        name: doc["name"],
        hasactivecart: doc["hasactivecart"]);
  }
}
