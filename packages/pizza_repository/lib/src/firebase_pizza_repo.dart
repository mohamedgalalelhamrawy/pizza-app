
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_repository/src/entities/entitys.dart';
import 'package:pizza_repository/src/models/pizza.dart';
import 'package:pizza_repository/src/pizza_repo.dart';

class FirebasePizzaRepo implements PizzaRepo{
    final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');


  @override
  Future<List<Pizza>> GetPizza() async {
    try {
      return await pizzaCollection .get().then((value) => value.docs.map((e) => 
          Pizza.fromEntity(Pizza_entity.fromDocument(e.data()))
        ).toList());
       
    } catch (e) {
     log(e.toString());
      rethrow;
    }
  }
  
}