import 'package:ecommerce_clean_architecture/features/main/domain/entities/bottom_navigation_bar_entitiy/bottom_navigation_bar_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/core/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/widgets/bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    int currentItem = context.watch<BottomNavigationCubit>().state.currentPage;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 27),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(17, 0, 0, 0),
            blurRadius: 10,
            offset: Offset(0, -1),
            spreadRadius: 5,
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
              context.read<BottomNavigationCubit>().changePage(
                currentPage: key,
              );
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
