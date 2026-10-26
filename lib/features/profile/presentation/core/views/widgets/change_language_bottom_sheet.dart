import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/selected_language_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    var currentLanguage = context.locale.languageCode;

    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: colorScheme.tertiaryFixedDim),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            SelectedLanguageWidget(
              language: "English",
              isSelected: currentLanguage == "en",
              onTap: () => _handleChangeLang(
                context: context,
                newLang: "en",
                currentLang: currentLanguage,
              ),
            ),

            const SizedBox(height: 10),
            SelectedLanguageWidget(
              language: "Arabic",
              isSelected: currentLanguage == "ar",
              onTap: () => _handleChangeLang(
                context: context,
                newLang: "ar",
                currentLang: currentLanguage,
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  void _handleChangeLang({
    required String newLang,
    required BuildContext context,
    required String currentLang,
  }) {
    if (newLang != currentLang) {
      context.setLocale(Locale(newLang));
    }
    context.pop();
  }
}
