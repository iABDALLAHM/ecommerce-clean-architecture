import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/views/widgets/about_us_page_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAboutUsPageAppBar(context),
      body: AboutUsPageViewBody(),
    );
  }

  AppBar buildAboutUsPageAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
      centerTitle: true,
      title: Text("من نحن", style: AppStyles.textStyle19Bold),
    );
  }
}
