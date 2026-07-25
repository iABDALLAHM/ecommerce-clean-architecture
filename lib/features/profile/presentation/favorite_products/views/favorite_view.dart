import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/function/build_profile_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/favorite_products/views/widgets/favorite_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/favorite_products/views/widgets/favorite_body_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return FavoriteBodyBlocProvider(
      child: Scaffold(
        appBar: buildProfileAppBar(
          context,
          title: LocaleKeys.profile_myFavoritePageAppBar.tr(),
        ),
        body: FavoriteBody(),
      ),
    );
  }
}
