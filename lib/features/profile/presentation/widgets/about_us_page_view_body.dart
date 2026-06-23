import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AboutUsPageViewBody extends StatelessWidget {
  const AboutUsPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Color(0xff949D9E),
                    ),
                    "هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.start,
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Color(0xff4E5556),
                    ),
                    "هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.start,
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Color(0xff949D9E),
                    ),
                    "هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. ",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.start,
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Color(0xff4E5556),
                    ),
                    "هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.start,
                    style: AppStyles.textStyle13Regular.copyWith(
                      color: Color(0xff4E5556),
                    ),
                    "هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
