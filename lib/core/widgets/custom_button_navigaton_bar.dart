import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/bottom_navigation_bar_entitiy/bottom_navigation_bar_entity.dart';
import 'package:ecommerce_clean_architecture/core/widgets/bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

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
        children: [
          BottomNavigationItem(
            onPressed: () => context.go(AppRoutes.home),
            isActive: currentRoute.startsWith(AppRoutes.home) ? true : false,
            barEntity: BottomNavigationBarEntity(
              activeIcon: Assets.imagesActiveHomeIcon,
              inActiveIcon: Assets.imagesInActiveHomeIcon,
              iconName: "الرئيسية",
            ),
          ),

          BottomNavigationItem(
            onPressed: () => context.go(AppRoutes.products),
            isActive: currentRoute.startsWith(AppRoutes.products)
                ? true
                : false,
            barEntity: BottomNavigationBarEntity(
              activeIcon: Assets.imagesActiveProductsIcon,
              inActiveIcon: Assets.imagesInActiveProductsIcon,
              iconName: "المنتجات",
            ),
          ),

          BottomNavigationItem(
            onPressed: () => context.go(AppRoutes.cart),
            isActive: currentRoute.startsWith(AppRoutes.cart) ? true : false,
            barEntity: BottomNavigationBarEntity(
              activeIcon: Assets.imagesActiveCartIcon,
              inActiveIcon: Assets.imagesInActiveCartIcon,
              iconName: "سلة التسوق",
            ),
          ),

          BottomNavigationItem(
            onPressed: () => context.go(AppRoutes.profile),
            isActive: currentRoute.startsWith(AppRoutes.profile) ? true : false,
            barEntity: BottomNavigationBarEntity(
              activeIcon: Assets.imagesActiveAccountIcon,
              inActiveIcon: Assets.imagesInActiveAccountIcon,
              iconName: "حسابي",
            ),
          ),
        ],

        // bottomNavigationList.asMap().entries.map((map) {
        //   var key = map.key;
        //   var value = map.value;
        //   return GestureDetector(
        //     onTap: () => context.go(value.route),
        //     child: BottomNavigationItem(
        //       isActive: currentRoute == value.route ? true : false,
        //       barEntity: value,
        //     ),
        //   );
        // }).toList(),
      ),
    );
  }
}
