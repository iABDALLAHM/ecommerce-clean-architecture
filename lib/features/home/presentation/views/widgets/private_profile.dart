import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/private_profile_body.dart';
import 'package:flutter/material.dart';

class PrivateProfile extends StatelessWidget {
  const PrivateProfile({super.key});
  static const String routeName = "privateProfile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPrivateProfileAppBar(context),
      body: PrivateProfileBody(),
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
