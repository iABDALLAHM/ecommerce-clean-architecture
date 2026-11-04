import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';

class BottomNavigationBarEntity {
  final String activeIcon, inActiveIcon;
  final String iconName;
  final String route;

  BottomNavigationBarEntity({
    required this.activeIcon,
    required this.inActiveIcon,
    required this.iconName,
    required this.route,
  });
}

List<BottomNavigationBarEntity> bottomNavigationList = [
  BottomNavigationBarEntity(
    activeIcon: Assets.imagesActiveHomeIcon,
    inActiveIcon: Assets.imagesInActiveHomeIcon,
    iconName: LocaleKeys.home_homeNavBar.tr(),
    route: AppRoutes.home,
  ),
  BottomNavigationBarEntity(
    activeIcon: Assets.imagesActiveProductsIcon,
    inActiveIcon: Assets.imagesInActiveProductsIcon,
    iconName: LocaleKeys.home_productsNavBar.tr(),
    route: AppRoutes.products,
  ),
  BottomNavigationBarEntity(
    activeIcon: Assets.imagesActiveCartIcon,
    inActiveIcon: Assets.imagesInActiveCartIcon,
    iconName: LocaleKeys.home_cartNavBar.tr(),
    route: AppRoutes.cart,
  ),
  BottomNavigationBarEntity(
    activeIcon: Assets.imagesActiveAccountIcon,
    inActiveIcon: Assets.imagesInActiveAccountIcon,
    iconName: LocaleKeys.profile_profileNavBar.tr(),
    route: AppRoutes.profile,
  ),
];
