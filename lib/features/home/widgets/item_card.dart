// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment_7/core/constants/color_constants.dart';
import 'package:assignment_7/features/home/providers/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:assignment_7/domain/entities/food_entity.dart';

class ItemCard extends ConsumerWidget {
  final FoodEntity food;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const ItemCard({
    required this.food,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    final notifier = ref.watch(foodProvider.notifier);
    final isSelected = notifier.isSelected(index);
    return GestureDetector(
      onTap: () {
        ref.read(foodProvider.notifier).toggleItemSelection(index);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 176,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: isSelected
                        ? Border.all(color: const Color(0xff37B890), width: 2)
                        : Border.all(color: const Color(0xffE9F3FB), width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image.asset(food.image, fit: BoxFit.cover),
                  ),
                ),
                if (isSelected)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              food.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Constants().titleTextColor,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              "Per Plate \$${food.price}",
              style: TextStyle(fontSize: 13, color: Constants().titleTextColor),
            ),
          ),
        ],
      ),
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(20, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
