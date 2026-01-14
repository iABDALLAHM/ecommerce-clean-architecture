import 'dart:io';

import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/image_field.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_profile_image.dart';
import 'package:flutter/material.dart';

class ProfileInformationSection extends StatefulWidget {
  const ProfileInformationSection({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<ProfileInformationSection> createState() =>
      _ProfileInformationSectionState();
}

class _ProfileInformationSectionState extends State<ProfileInformationSection> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showEditImageBottomSheet(context: context);
          },
          child: CustomProfileImage(imageUrl: widget.imageUrl),
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(getUserData().name, style: AppStyles.textStyle13Bold),
            const SizedBox(height: 2),
            Text(
              getUserData().email,
              style: AppStyles.textStyle13Bold.copyWith(
                color: Color(0xff888FA0),
              ),
            ),
          ],
        ),
      ],
    );
  }

  PersistentBottomSheetController showEditImageBottomSheet({
    required BuildContext context,
  }) {
    return showBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageField(
                onChange: (value) {
                  if (imageFile != null) {
                    imageFile = value;
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 54,
                width: MediaQuery.sizeOf(context).width * .6,
                child: CustomButton(text: "تعديل الصورة", onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
