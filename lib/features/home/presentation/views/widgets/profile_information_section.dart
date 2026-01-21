import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/function/show_edit_image_button_sheet.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_profile_image.dart';
import 'package:flutter/material.dart';

class ProfileInformationSection extends StatefulWidget {
  const ProfileInformationSection({super.key});

  @override
  State<ProfileInformationSection> createState() =>
      _ProfileInformationSectionState();
}

class _ProfileInformationSectionState extends State<ProfileInformationSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showEditImageBottomSheet(context: context);
          },
          child: CustomProfileImage(),
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
}
