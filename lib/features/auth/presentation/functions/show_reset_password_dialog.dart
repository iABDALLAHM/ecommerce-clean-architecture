import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<void> showResetPasswordDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: Align(
        alignment: AlignmentGeometry.centerRight,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.close, color: Colors.black, size: 30),
        ),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              SvgPicture.asset(Assets.imagesCheckMarkIcon),
              const SizedBox(height: 29),
              Text("تم تغيير الباسورد بنجاح", style: AppStyles.textStyle16Bold),
            ],
          ),
        ),
      ),
    ),
  );
}
