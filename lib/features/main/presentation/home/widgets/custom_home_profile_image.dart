import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomHomeProfileImage extends StatelessWidget {
  const CustomHomeProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.lightPrimaryColor,
      radius: 24,
      child: CircleAvatar(
        radius: 17,
        backgroundColor: Colors.transparent,
        child: Image.network(
          getUserData().userImage,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.person);
          },
        ),
      ),
    );
  }
}
