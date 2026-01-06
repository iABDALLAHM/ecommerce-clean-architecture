import 'package:ecommerce_clean_architecture/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/bottom_navigation_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onChange});
  final ValueChanged<int> onChange;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(17, 0, 0, 0),
            blurRadius: 10,
            offset: Offset(0, -1),
            spreadRadius: 10,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: bottomNavigationList.asMap().entries.map((map) {
          var key = map.key;
          var value = map.value;
          return GestureDetector(
            onTap: () {
              currentItem = key;
              widget.onChange(currentItem);
              setState(() {});
            },
            child: BottomNavigationItem(
              isActive: currentItem == key ? true : false,
              barEntity: value,
            ),
          );
        }).toList(),
      ),
    );
  }
}
