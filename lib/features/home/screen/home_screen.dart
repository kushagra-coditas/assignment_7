import 'package:assignment_7/features/orders/screen/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_7/features/home/widgets/item_card.dart';
import 'package:assignment_7/features/home/widgets/app_bar.dart';
import 'package:assignment_7/features/home/providers/home_notifier.dart';
import 'package:assignment_7/features/home/providers/home_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
   const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = SizedBox();
    final notifier = ref.watch(foodProvider.notifier);
    final selectedCount = notifier.selectedIndexes.length;
    

    final state = ref.watch(foodProvider);
    final food = notifier.food;

    if (state is LoadingFood) {
      content = Center(child: CircularProgressIndicator());
    } else if (state is LoadedFood) {
      content = Expanded(
        child: GridView.builder(
          itemCount: food.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.67,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),

          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: index % 2 != 0 ? 30 : 0),
              child: ItemCard(
                food: food[index],
                onTap: () {},
                isSelected: true,
                index: index,
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(25.0),
          child: Column(children: [Appbar(), SizedBox(height: 20), content]),
        ),
      ),
      bottomNavigationBar: selectedCount > 0
          ? Padding(
              padding:  EdgeInsets.all(12),
              child: ClipPath(
                clipper: TrapeziumClipper(),
                child: Container(
                  color: Colors.white,
                  padding:  EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                           Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.black,
                            size: 24,
                          ),
                           SizedBox(width: 8),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: selectedCount.toString().padLeft(
                                    2,
                                    '0',
                                  ),
                                  style:  TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                 TextSpan(
                                  text: " Plates in cart",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      ClipPath(
                        clipper: TrapeziumClipper(),
                        child: Material(
                          color:  Color(0xFF1F1970),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>  OrdersScreen(),
                                ),
                              );
                            },
                            child:  Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              child: Text(
                                "My Order",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
