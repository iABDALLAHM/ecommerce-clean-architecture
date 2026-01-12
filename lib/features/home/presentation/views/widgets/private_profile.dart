import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PrivateProfile extends StatelessWidget {
  const PrivateProfile({super.key});
  static const String routeName = "privateProfile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPrivateProfileAppBar(context),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    "المعلومات الشخصيه",
                    style: AppStyles.textStyle13SemiBold,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildPrivateProfileAppBar(BuildContext context) {
    return AppBar(
      title: Text("الملف الشخصي", style: AppStyles.textStyle19Bold),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
