import 'package:assignment_7/data/repository_impl/food_repository_impl.dart';
import 'package:assignment_7/domain/entities/food_entity.dart';
import 'package:assignment_7/domain/repository/food_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchFoodUsecase {
  final FoodRepository repository;

  FetchFoodUsecase({required this.repository});

  Future<List<FoodEntity>> fetchFoodUsecase() async {
    return await repository.foodrepository();
  }
}

final usecaseProvider = StateProvider<FetchFoodUsecase>(
  (ref) => FetchFoodUsecase(repository: ref.watch(foodRepositoryImplProvider)),
);
