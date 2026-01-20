import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/private_profile_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/private_profile_body_bloc_consumer.dart';
import 'package:flutter/material.dart';

class PrivateProfile extends StatelessWidget {
  const PrivateProfile({super.key});
  static const String routeName = "privateProfile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPrivateProfileAppBar(context),
      body: PrivateProfileBodyBlocConsumer(child: PrivateProfileBody()),
    );
  }

  AppBar buildPrivateProfileAppBar(BuildContext context) {
    return AppBar(
      title: Text("الملف الشخصي", style: AppStyles.textStyle19Bold),
      centerTitle: true,
      leading: CustomArrowBack(),
    );
  }
}
