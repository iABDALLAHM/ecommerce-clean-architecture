import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_notification_icon.dart';
import 'package:flutter/widgets.dart';

class CustomNotificationAppBar extends StatelessWidget {
  const CustomNotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomArrowBack(),
        Text("الاشعارات", style: AppStyles.textStyle19Bold),
        CustomNotificationIcon(),
      ],
    );
  }
}
