import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/best_selling_view_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/home_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/notification_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/search_body.dart';
import 'package:flutter/material.dart';

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
          case NotificationBody.routeName:
            return MaterialPageRoute(builder: (context) => NotificationBody());
          default:
            return MaterialPageRoute(builder: (context) => HomeBody());
        }
      },
    );
  }
}
