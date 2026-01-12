import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_language_section_item.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_notification_profile_item.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_item_section.dart';
import 'package:flutter/material.dart';

class ProfileBodySections extends StatelessWidget {
  const ProfileBodySections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text("عام", style: AppStyles.textStyle13SemiBold),
        const SizedBox(height: 16),
        ProfileSectionItem(
          onPressed: () {},
          icon: Assets.imagesPresonIcon,
          name: "الملف الشخصي",
        ),
        const SizedBox(height: 4),
        ProfileSectionItem(
          icon: Assets.imagesOrdersIcon,
          name: "طلباتي",
          onPressed: () {},
        ),
        const SizedBox(height: 4),
        ProfileSectionItem(
          onPressed: () {},
          icon: Assets.imagesWalletIcon,
          name: "المدفوعات",
        ),
        const SizedBox(height: 4),
        ProfileSectionItem(
          onPressed: () {},
          icon: Assets.imagesFavoriteIcon,
          name: "المفضلة",
        ),
        const SizedBox(height: 4),
        CustomSwitchProfileItem(
          icon: Assets.imagesNotificationIcon,
          name: 'الاشعارات',
          onPressed: () {},
        ),
        const SizedBox(height: 4),
        CustomLanguageSectionItem(
          onPressed: () {},
          icon: Assets.imagesLanguageIcon,
          name: "اللغة",
        ),
        const SizedBox(height: 4),
        CustomSwitchProfileItem(
          icon: Assets.imagesModeIcon,
          name: "الوضع",
          onPressed: () {},
        ),
        const SizedBox(height: 22),
        Text("المساعده", style: AppStyles.textStyle13SemiBold),
        const SizedBox(height: 16),
        ProfileSectionItem(
          icon: Assets.imagesHelpIcon,
          name: "من نحن",
          onPressed: () {},
        ),
      ],
    );
  }
}
