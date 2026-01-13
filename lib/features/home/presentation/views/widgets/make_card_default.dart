import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/widgets/custom_terms_and_conditions_button.dart';
import 'package:flutter/widgets.dart';

class MakeCardDefault extends StatelessWidget {
  const MakeCardDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTermsAndConditionsButton(onChange: (value) {}),
        const SizedBox(width: 16),
        Text(
          "جعل البطاقة افتراضية",
          style: AppStyles.textStyle13SemiBold.copyWith(
            color: Color(0xff616A6B),
          ),
        ),
      ],
    );
  }
}
