import 'package:pizza_repository/src/entities/macros_entity.dart';
import 'package:pizza_repository/src/models/macros.dart';

class Pizza_entity {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  Pizza_entity(
      {required this.pizzaId,
      required this.description,
      required this.discount,
      required this.isVeg,
      required this.name,
      required this.picture,
      required this.price,
      required this.spicy,
      required this.macros,
      });

  Map<String, Object> toDocument() {
    return {
      "pizzaId": pizzaId,
      "picture": picture,
      "isVeg": isVeg,
      "spicy": spicy,
      "name": name,
      "description": description,
      "price": price,
      "discount": discount,
      "macros" : macros.toEntity().toDocument()
    };
  }

  static Pizza_entity fromDocument(Map<String, dynamic> doc) {
    return Pizza_entity(
        pizzaId: doc["pizzaId"],
        description: doc["description"],
        discount: doc["discount"],
        isVeg: doc["isVeg"],
        name: doc["name"],
        picture: doc["picture"],
        price: doc["price"],
        spicy: doc["spicy"],
        macros:Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])),
        );
  }
}
