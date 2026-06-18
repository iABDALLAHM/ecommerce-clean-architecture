import 'package:ecommerce_clean_architecture/features/main/presentation/widgets/best_selling_view_body.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/widgets/home_body.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/views/widgets/search_body.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/views/notification_view.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case BestSellingBody.routeName:
            return MaterialPageRoute(builder: (context) => BestSellingBody());
          case SearchBody.routeName:
            return MaterialPageRoute(builder: (context) => SearchBody());
          case NotificationView.routeName:
            return MaterialPageRoute(builder: (context) => NotificationView());
          default:
            return MaterialPageRoute(builder: (context) => HomeBody());
        }
      },
    );
  }
}
