import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 22),
          child: SvgPicture.asset(Assets.imagesSearchillstrationIcon),
        ),
        const SizedBox(height: 43),
        Text(
          "البحث",
          style: AppStyles.textStyle16Bold.copyWith(color: Color(0xff616A6B)),
        ),
        Text(
          "عفوًا... هذه المعلومات غير متوفرة للحظة",
          style: AppStyles.textStyle13Regular.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
      ],
    );
  }
}