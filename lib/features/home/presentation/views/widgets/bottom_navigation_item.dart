import 'package:ecommerce_clean_architecture/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/active_icon.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/in_active_icon.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.isActive,
    required this.barEntity,
  });
  final bool isActive;
  final BottomNavigationBarEntity barEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveIcon(
            activeIcon: barEntity.activeIcon,
            iconName: barEntity.iconName,
          )
        : InActiveIcon(inActiveIcon: barEntity.inActiveIcon);
  }
}
