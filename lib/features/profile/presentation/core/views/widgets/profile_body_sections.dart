import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/change_language_bottom_sheet.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body_item.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_language_body_item.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body_switch_item.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileBodySections extends StatefulWidget {
  const ProfileBodySections({super.key});

  @override
  State<ProfileBodySections> createState() => _ProfileBodySectionsState();
}

class _ProfileBodySectionsState extends State<ProfileBodySections> {
  String currentLang = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          LocaleKeys.profile_profilePageHeader.tr(),
          style: AppStyles.textStyle13SemiBold,
        ),
        const SizedBox(height: 16),
        ProfileBodyItem(
          onPressed: () =>
              context.go("${AppRoutes.profile}${AppRoutes.userProfile}"),
          icon: Assets.imagesPresonIcon,
          name: LocaleKeys.profile_profileSection.tr(),
        ),
        const SizedBox(height: 4),
        ProfileBodyItem(
          icon: Assets.imagesOrdersIcon,
          name: LocaleKeys.profile_myOrdersSection.tr(),
          onPressed: () =>
              context.go("${AppRoutes.profile}${AppRoutes.myOrders}"),
        ),
        const SizedBox(height: 4),
        ProfileBodyItem(
          onPressed: () =>
              context.go("${AppRoutes.profile}${AppRoutes.myPayments}"),
          icon: Assets.imagesWalletIcon,
          name: LocaleKeys.profile_myPaymentsSection.tr(),
        ),
        const SizedBox(height: 4),
        ProfileBodyItem(
          onPressed: () =>
              context.go("${AppRoutes.profile}${AppRoutes.favorite}"),
          icon: Assets.imagesFavoriteIcon,
          name: LocaleKeys.profile_myFavoriteSection.tr(),
        ),
        const SizedBox(height: 4),
        ProfileBodySwitchItem(
          icon: Assets.imagesNotificationIcon,
          name: LocaleKeys.profile_myNotificationsSection.tr(),
          onChange: (value) {
            // context.read<SwitchButtonCubit>().changeState(value: !isActive);
          },
        ),
        const SizedBox(height: 4),
        ProfileLanguageBodyItem(
          currentLang: currentLang,
          onPressed: () {
            showModalBottomSheet(
              useRootNavigator: true,
              backgroundColor: Colors.white,
              context: context,
              builder: (context) {
                return ChangeLanguageBottomSheet(
                  onChange: (String p1) {
                    currentLang = p1;
                    setState(() {});
                  },
                );
              },
            );
          },
          icon: Assets.imagesLanguageIcon,
          name: LocaleKeys.profile_myLanguageSection.tr(),
        ),
        const SizedBox(height: 4),
        ProfileBodySwitchItem(
          icon: Assets.imagesModeIcon,
          name: LocaleKeys.profile_currentSection.tr(),
          onChange: (value) {
            // context.read<SwitchButtonCubit>().changeState(value: !isActive);
          },
        ),

        const SizedBox(height: 22),
        Text(
          LocaleKeys.profile_profileFooterText.tr(),
          style: AppStyles.textStyle13SemiBold,
        ),
        const SizedBox(height: 16),
        ProfileBodyItem(
          icon: Assets.imagesHelpIcon,
          name: LocaleKeys.profile_whoAreSection.tr(),
          onPressed: () => context.go("${AppRoutes.profile}${AppRoutes.about}"),
        ),
      ],
    );
  }
}
