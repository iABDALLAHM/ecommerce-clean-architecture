import 'package:ecommerce_clean_architecture/core/utils/assets.dart';

class BottomNavigationBarEntity {
  final String activeIcon, inActiveIcon;
  final String iconName;

  BottomNavigationBarEntity({
    required this.activeIcon,
    required this.inActiveIcon,
    required this.iconName,
  });
  
}
List<BottomNavigationBarEntity> bottomNavigationList = [
    BottomNavigationBarEntity(
      activeIcon: Assets.imagesActiveHomeIcon,
      inActiveIcon: Assets.imagesInActiveHomeIcon,
      iconName: "الرئيسية",
    ),
    BottomNavigationBarEntity(
      activeIcon: Assets.imagesActiveProductsIcon,
      inActiveIcon: Assets.imagesInActiveProductsIcon,
      iconName: "المنتجات",
    ),
    BottomNavigationBarEntity(
      activeIcon: Assets.imagesActiveCartIcon,
      inActiveIcon: Assets.imagesInActiveCartIcon,
      iconName: "سلة التسوق",
    ),
    BottomNavigationBarEntity(
      activeIcon: Assets.imagesActiveAccountIcon,
      inActiveIcon: Assets.imagesInActiveAccountIcon,
      iconName: "حسابي",
    ),
  ];