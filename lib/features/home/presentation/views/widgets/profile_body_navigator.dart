import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/about_us_page.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/add_new_wallet_method_view.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/favorite_page.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/orders_section.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/private_profile.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/wallet_body.dart';
import 'package:flutter/material.dart';

class ProfileBodyNavigator extends StatelessWidget {
  const ProfileBodyNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case PrivateProfile.routeName:
            return MaterialPageRoute(builder: (context) => PrivateProfile());
          case OrdersSection.routeName:
            return MaterialPageRoute(builder: (context) => OrdersSection());
          case AboutUsPage.routeName:
            return MaterialPageRoute(builder: (context) => AboutUsPage());
          case FavoritePage.routeName:
            return MaterialPageRoute(builder: (context) => FavoritePage());
          case WalletBody.routeName:
            return MaterialPageRoute(builder: (context) => WalletBody());
          case AddNewWalletMethodView.routeName:
            return MaterialPageRoute(builder: (context) => AddNewWalletMethodView());
          default:
            return MaterialPageRoute(builder: (context) => ProfileBody());
        }
      },
    );
  }
}

