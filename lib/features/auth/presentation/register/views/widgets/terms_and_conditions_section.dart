import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/register/views/widgets/custom_terms_and_conditions_button.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsSection extends StatelessWidget {
  const TermsAndConditionsSection({super.key, required this.onChange});
  final ValueChanged<bool> onChange;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CustomTermsAndConditionsButton(
            onChange: (value) {
              onChange(value);
            },
          ),
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: LocaleKeys.auth_signUp_termsAndConditions1.tr() + " ",
                  style: AppStyles.textStyle13SemiBold.copyWith(
                    color: colorScheme.tertiaryContainer,
                  ),
                ),
                TextSpan(
                  text: LocaleKeys.auth_signUp_termsAndConditions2.tr(),
                  style: AppStyles.textStyle13SemiBold.copyWith(
                    color: colorScheme.primaryFixed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
