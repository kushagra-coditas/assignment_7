import 'package:assignment_7/domain/usecase/fetch_food_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_7/features/home/providers/home_state.dart';
import 'package:assignment_7/domain/entities/food_entity.dart';

class HomeNotifier extends StateNotifier<HomeStates> {
  List<FoodEntity> food = [];
  Set<int> selectedIndexes = {};
  List<FoodEntity> cart = [];
  final FetchFoodUsecase fetchFoodUsecase;
  HomeNotifier(this.fetchFoodUsecase) : super(LoadingFood()) {
    loadingFood();
  }

  Future<void> loadingFood() async {
    await Future.delayed(Duration(seconds: 2));

    final foodList = await fetchFoodUsecase.fetchFoodUsecase();
    food = foodList;

    state = LoadedFood();
  }

  void toggleItemSelection(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
      cart.remove(food[index]);
    } else {
      selectedIndexes.add(index);
      cart.add(food[index]);
    }

    state = LoadedFood();
  }

  bool isSelected(int index) {
    return selectedIndexes.contains(index);
  }
}

final foodProvider = StateNotifierProvider<HomeNotifier, HomeStates>((ref) {
  final usecase = ref.watch(usecaseProvider);
  return HomeNotifier(usecase);
});

final selectionProvider = StateProvider<Set<int>>((ref) => {});

final cartCountProvider = Provider<int>((ref) {
  final notifier = ref.watch(foodProvider.notifier);
  return notifier.cart.fold(0, (sum, item) => sum);
});
