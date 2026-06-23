import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/widgets/favorite_page_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/widgets/favorite_page_body.dart';
import 'package:flutter/material.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});
  @override
  Widget build(BuildContext context) {
    return FavoritePageBlocProvider(
      child: Scaffold(
        appBar: buildFavoritePageAppBar(context),
        body: FavoritePageBody(),
      ),
    );
  }

  AppBar buildFavoritePageAppBar(BuildContext context) => AppBar(
    centerTitle: true,
    leading: CustomArrowBackAppBar(),
    title: Text("المفضلة", style: AppStyles.textStyle19Bold),
  );
}
