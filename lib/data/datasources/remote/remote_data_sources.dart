import 'package:assignment_7/domain/entities/food_entity.dart';

 class RemoteDataSources {
  Future<List<FoodEntity>> fetchFoodItems() {
    return fetchFoodItems();
  }
}
class FoodRemoteDataSources extends RemoteDataSources {
  @override
  Future<List<FoodEntity>> fetchFoodItems() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      FoodEntity(
        name: "Tuna Fish",
        price: 30.0,
        image: "assets/images/tuna.png",
        category: "Seafood",
      ),
      FoodEntity(
        name: "Rice & Bread",
        price: 24.0,
        image: "assets/images/rice_and_bread.png",
        category: "Staple",
      ),
      FoodEntity(
        name: "Eggs Celery",
        price: 12.0,
        image: "assets/images/eggs_celery.png",
        category: "Healthy",
      ),
      FoodEntity(
        name: "Herby Veg",
        price: 18.0,
        image: "assets/images/herby_veg.png",
        category: "Veg",
      ),
      FoodEntity(
        name: "Kebabs",
        price: 35.0,
        image: "assets/images/kebabs.png",
        category: "Indian",
      ),
      FoodEntity(
        name: "Penne Pasta",
        price: 28.0,
        image: "assets/images/penne_pasta.png",
        category: "Italian",
      ),
    ];
  }
}
