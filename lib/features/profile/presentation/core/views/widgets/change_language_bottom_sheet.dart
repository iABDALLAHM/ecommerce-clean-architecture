import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/selected_language_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet({super.key});
  @override
  State<ChangeLanguageBottomSheet> createState() =>
      _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  String selectedLanguage = "";

  @override
  Widget build(BuildContext context) {
    var currentLanguage = context.locale.languageCode;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            SelectedLanguageWidget(
              language: "English ",
              isSelected: currentLanguage == "en",
              onTap: () {
                setState(() {
                  selectedLanguage = "en";
                });
                if (selectedLanguage != currentLanguage) {
                  context.setLocale(Locale(selectedLanguage));
                  context.pop();
                }
              },
            ),

            const SizedBox(height: 10),
            SelectedLanguageWidget(
              language: "Arabic ",
              isSelected: currentLanguage == "ar",
              onTap: () {
                setState(() {
                  selectedLanguage = "ar";
                });
                if (selectedLanguage != currentLanguage) {
                  context.setLocale(Locale(selectedLanguage));
                  context.pop();
                }
              },
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
