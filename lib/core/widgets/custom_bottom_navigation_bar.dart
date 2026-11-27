import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/bottom_navigation_bar_entitiy/bottom_navigation_bar_entity.dart';
import 'package:ecommerce_clean_architecture/core/widgets/bottom_navigation_item.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarEntity> bottomNavigationList = [
      BottomNavigationBarEntity(
        activeIcon: Assets.imagesActiveHomeIcon,
        inActiveIcon: Assets.imagesInActiveHomeIcon,
        iconName: LocaleKeys.home_homeNavBar.tr(context: context),
        route: AppRoutes.home,
      ),
      BottomNavigationBarEntity(
        activeIcon: Assets.imagesActiveProductsIcon,
        inActiveIcon: Assets.imagesInActiveProductsIcon,
        iconName: LocaleKeys.home_productsNavBar.tr(context: context),
        route: AppRoutes.products,
      ),
      BottomNavigationBarEntity(
        activeIcon: Assets.imagesActiveCartIcon,
        inActiveIcon: Assets.imagesInActiveCartIcon,
        iconName: LocaleKeys.home_cartNavBar.tr(context: context),
        route: AppRoutes.cart,
      ),
      BottomNavigationBarEntity(
        activeIcon: Assets.imagesActiveAccountIcon,
        inActiveIcon: Assets.imagesInActiveAccountIcon,
        iconName: LocaleKeys.profile_profileNavBar.tr(context: context),
        route: AppRoutes.profile,
      ),
    ];
    final currentRoute = GoRouterState.of(context).uri.toString();
    var colorScheme = Theme.of(context);

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
        color: colorScheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(bottomNavigationList.length, (index) {
          var item = bottomNavigationList[index];
          return BottomNavigationItem(
            onPressed: () => context.go(item.route),
            isActive: currentRoute == item.route ? true : false,
            barEntity: BottomNavigationBarEntity(
              activeIcon: item.activeIcon,
              inActiveIcon: item.inActiveIcon,
              iconName: item.iconName,
              route: item.route,
            ),
          );
        }),
      ),
    );
  }
}
