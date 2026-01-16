import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/favorite_page_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/favorite_page_body.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});
  static const String routeName = "FavoritePage";
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
    leading: CustomArrowBack(),
    title: Text("المفضلة", style: AppStyles.textStyle19Bold),
  );
}
