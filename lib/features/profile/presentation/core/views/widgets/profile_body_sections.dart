import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body_item.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_language_body_item.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body_switch_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileBodySections extends StatelessWidget {
  const ProfileBodySections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text("عام", style: AppStyles.textStyle13SemiBold),
        const SizedBox(height: 16),
        ProfileBodyItem(
          onPressed: () =>
              context.go("${AppRoutes.profile}${AppRoutes.userProfile}"),
          icon: Assets.imagesPresonIcon,
          name: "الملف الشخصي",
        ),
        const SizedBox(height: 4),
        ProfileBodyItem(
          icon: Assets.imagesOrdersIcon,
          name: "طلباتي",
          onPressed: () =>
              context.go("${AppRoutes.profile}${AppRoutes.myOrders}"),
        ),
        const SizedBox(height: 4),
        ProfileBodyItem(
          onPressed: () =>
              context.go("${AppRoutes.profile}${AppRoutes.myPayments}"),
          icon: Assets.imagesWalletIcon,
          name: "المدفوعات",
        ),
        const SizedBox(height: 4),
        ProfileBodyItem(
          onPressed: () =>
              context.go("${AppRoutes.profile}${AppRoutes.favorite}"),
          icon: Assets.imagesFavoriteIcon,
          name: "المفضلة",
        ),
        const SizedBox(height: 4),
        ProfileBodySwitchItem(
          icon: Assets.imagesNotificationIcon,
          name: 'الاشعارات',
          onChange: (value) {
            // context.read<SwitchButtonCubit>().changeState(value: !isActive);
          },
        ),
        const SizedBox(height: 4),
        ProfileLanguageBodyItem(
          onPressed: () {},
          icon: Assets.imagesLanguageIcon,
          name: "اللغة",
        ),
        const SizedBox(height: 4),
        ProfileBodySwitchItem(
          icon: Assets.imagesModeIcon,
          name: "الوضع",
          onChange: (value) {
            // context.read<SwitchButtonCubit>().changeState(value: !isActive);
          },
        ),

        const SizedBox(height: 22),
        Text("المساعده", style: AppStyles.textStyle13SemiBold),
        const SizedBox(height: 16),
        ProfileBodyItem(
          icon: Assets.imagesHelpIcon,
          name: "من نحن",
          onPressed: () => context.go("${AppRoutes.profile}${AppRoutes.about}"),
        ),
      ],
    );
  }
}
