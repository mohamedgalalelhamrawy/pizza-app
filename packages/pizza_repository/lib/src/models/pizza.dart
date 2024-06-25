import 'package:pizza_repository/src/entities/pizza_entity.dart';
import 'package:pizza_repository/src/models/macros.dart';

class Pizza {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  Pizza({
    required this.description,
    required this.discount,
    required this.isVeg,
    required this.name,
    required this.picture,
    required this.pizzaId,
    required this.price,
    required this.spicy,
    required this.macros,
  });

  Pizza_entity toEntity() {
    return Pizza_entity(
        pizzaId: pizzaId,
        description: description,
        discount: discount,
        isVeg: isVeg,
        name: name,
        picture: picture,
        price: price,
        spicy: spicy,
        macros: macros);
  }

  static Pizza fromEntity(Pizza_entity entity) {
    return Pizza(
        description: entity.description,
        discount: entity.discount,
        isVeg: entity.isVeg,
        name: entity.name,
        picture: entity.picture,
        pizzaId: entity.pizzaId,
        price: entity.price,
        spicy: entity.spicy,
        macros: entity.macros);
  }
}
