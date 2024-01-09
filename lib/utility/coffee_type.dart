import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoffeeType extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  void Function()? onTap;

  CoffeeType({
    required this.coffeeType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffeeType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
