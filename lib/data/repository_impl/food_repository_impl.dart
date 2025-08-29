import 'package:assignment_7/data/datasources/remote/remote_data_sources.dart';

import 'package:assignment_7/domain/entities/food_entity.dart';
import 'package:assignment_7/domain/repository/food_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodRepositoryImpl extends FoodRepository {
  @override
  Future<List<FoodEntity>> foodrepository() {
    return FoodRemoteDataSources().fetchFoodItems();
  }
}

final foodRepositoryImplProvider = StateProvider<FoodRepository>(
  (ref) => FoodRepositoryImpl(),
);
