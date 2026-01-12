import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_notification_profile_item.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_body_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_information_section.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_item_section.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ProfileBodyAppBar(),
            const SizedBox(height: 16),
            ProfileInformationSection(imageUrl: ""),
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

            CustomNotificationProfileItem(
              icon: Assets.imagesNotificationIcon,
              name: 'الاشعارات',
              onPressed: () {},
            ),
            const SizedBox(height: 4),
            ProfileSectionItem(
              icon: Assets.imagesHelpIcon,
              name: "من نحن",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
