import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_dialog_button.dart';
import 'package:ecommerce_clean_architecture/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        backgroundColor: Colors.white,
        icon: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.close, size: 30, color: Colors.black),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "هل ترغب في تسجيل الخروج ؟",
                style: AppStyles.textStyle16Bold,
              ),
              const SizedBox(height: 29),
              Row(
                children: [
                  Expanded(
                    child: CustomDialogButton(
                      hintText: "تأكيد",
                      onPressed: () {
                        // triger cubit
                        Navigator.of(
                          context,
                        ).pushNamed(OnboardingView.routeName);
                      },
                      isPrimary: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomDialogButton(
                      hintText: "لا ارغب",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      isPrimary: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
