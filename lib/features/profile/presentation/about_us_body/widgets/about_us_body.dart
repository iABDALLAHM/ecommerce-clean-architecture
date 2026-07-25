import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/function/build_profile_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/about_us_body/widgets/about_us_page_view_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildProfileAppBar(
        context,
        title: LocaleKeys.profile_whoArePageAppBar.tr(),
      ),
      body: AboutUsPageViewBody(),
    );
  }
}
