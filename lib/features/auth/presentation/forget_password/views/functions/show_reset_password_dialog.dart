import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

Future<void> showResetPasswordDialog({required BuildContext context}) async {
  var colorScheme = Theme.of(context).colorScheme;
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: Align(
        alignment: AlignmentGeometry.centerRight,
        child: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(Icons.close, color: colorScheme.onSurface, size: 30),
        ),
      ),
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              SvgPicture.asset(Assets.imagesCheckMarkIcon),
              const SizedBox(height: 29),
              Text(
                LocaleKeys.auth_resetYourPassword_resetYourPasswordDialog.tr(),
                style: AppStyles.textStyle16Bold,
              ),
              const SizedBox(height: 8),
              CustomButton(
                text: LocaleKeys.auth_loginPage_loginPageAppBar.tr(),
                onPressed: () => context.go(AppRoutes.login),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
