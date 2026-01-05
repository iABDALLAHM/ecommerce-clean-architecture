import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialCustomButton extends StatelessWidget {
  const SocialCustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });
  final Function() onPressed;
  final String text, icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          side: BorderSide(color: Color(0xffDDDFDF)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Spacer(),
            Spacer(),
            Text(text, style: AppStyles.textStyle16SemiBold),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}