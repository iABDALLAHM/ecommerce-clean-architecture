import 'package:ecommerce_clean_architecture/features/main/domain/entities/bottom_navigation_bar_entitiy/bottom_navigation_bar_entity.dart';
import 'package:ecommerce_clean_architecture/core/widgets/active_icon.dart';
import 'package:ecommerce_clean_architecture/core/widgets/in_active_icon.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.isActive,
    required this.barEntity,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  final bool isActive;
  final BottomNavigationBarEntity barEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? GestureDetector(
            onTap: onPressed,
            child: ActiveIcon(
              activeIcon: barEntity.activeIcon,
              iconName: barEntity.iconName,
            ),
          )
        : GestureDetector(
            onTap: onPressed,
            child: InActiveIcon(inActiveIcon: barEntity.inActiveIcon),
          );
  }
}
