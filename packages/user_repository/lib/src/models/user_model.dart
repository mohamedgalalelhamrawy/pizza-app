import 'package:user_repository/src/entities/user_entity.dart';

class MyUser {
  final String userId;
  final String email;
  final String name;
  final bool hasactivecart;

  MyUser(
      {required this.userId,
      required this.email,
      required this.name,
      required this.hasactivecart});

  final empty = MyUser(userId: "", email: "", name: "", hasactivecart: false);

  UserEntity toEntity() {
    return UserEntity(
        userId: userId, email: email, name: name, hasactivecart: hasactivecart);
  }

  MyUser fromEntity(UserEntity entity) {
    return MyUser(
        userId: entity.userId,
        email: entity.email,
        name: entity.name,
        hasactivecart: entity.hasactivecart);
  }

    @override
  String toString() {
    return 'MyUser: $userId, $email, $name, $hasactivecart';
  }
}
