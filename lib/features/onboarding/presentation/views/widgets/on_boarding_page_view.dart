import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/widgets/on_boarding_page_view_item.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageController,
      children: [
        OnBoardingPageViewItem(
          isSecond: true,
          backgroundImage: Assets.imagesFirstSplashViewBackground,
          onBoardingLogo: Assets.imagesFirstSplashViewLogo,
          widget: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: LocaleKeys.onBoarding_hello.tr(),
                  style: AppStyles.textStyle23Bold,
                ),
                TextSpan(
                  text: "Fruit",
                  style: AppStyles.textStyle23Bold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: "HUB",
                  style: AppStyles.textStyle23Bold.copyWith(
                    color: AppColors.secondryColor,
                  ),
                ),
              ],
            ),
          ),
          subTitle: LocaleKeys.onBoarding_description1.tr(),
        ),
        OnBoardingPageViewItem(
          isSecond: false,
          backgroundImage: Assets.imagesSecondSplashViewBackground,
          onBoardingLogo: Assets.imagesSecondSplashViewLogo,
          widget: Text(
            LocaleKeys.onBoarding_shopping.tr(),
            style: AppStyles.textStyle23Bold,
          ),
          subTitle: LocaleKeys.onBoarding_description2.tr(),
        ),
      ],
    );
  }
}
