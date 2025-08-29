import 'package:assignment_7/domain/entities/food_entity.dart';

abstract class FoodRepository {
  Future<List<FoodEntity>> foodrepository();
}
