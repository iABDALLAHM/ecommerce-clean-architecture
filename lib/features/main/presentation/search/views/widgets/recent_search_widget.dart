
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/widgets.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("عمليات البحث الأخيرة", style: AppStyles.textStyle13SemiBold),
            Text(
              "حذف الكل",
              style: AppStyles.textStyle13SemiBold.copyWith(
                color: Color(0xff949D9E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}