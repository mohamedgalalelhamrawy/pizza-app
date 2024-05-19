class userEntity {
  final String userId;
  final String email;
  final String name;
  final bool hasactivecart;

  userEntity(
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

  userEntity fromDocument(Map<String, dynamic> doc) {
    return userEntity(
        userId: doc["userId"],
        email: doc["email"],
        name: doc["name"],
        hasactivecart: doc["hasactivecart"]);
  }
}
