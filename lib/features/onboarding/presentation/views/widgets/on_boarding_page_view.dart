import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/widgets/on_boarding_page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        OnBoardingPageViewItem(
          isSecond: true,
          backgroundImage: Assets.imagesFirstSplashViewBackground,
          onBoardingLogo: Assets.imagesFirstSplashViewLogo,
          widget: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "مرحبًا بك في ",
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
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        OnBoardingPageViewItem(
          isSecond: false,
          backgroundImage: Assets.imagesSecondSplashViewBackground,
          onBoardingLogo: Assets.imagesSecondSplashViewLogo,
          widget: Text("ابحث وتسوق", style: AppStyles.textStyle23Bold),
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        ),
      ],
    );
  }
}
