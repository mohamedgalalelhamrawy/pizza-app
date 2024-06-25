
  import 'package:pizza_repository/src/models/model.dart';

abstract class PizzaRepo {
    Future<List<Pizza>> GetPizza ();
  }