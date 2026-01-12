import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_body_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_information_section.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ProfileBodyAppBar(),
            const SizedBox(height: 16),
            ProfileInformationSection(imageUrl: ""),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
