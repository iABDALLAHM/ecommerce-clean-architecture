import 'package:ecommerce_clean_architecture/features/home/presentation/views/best_selling_view.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        if (settings.name == BestSellingView.routeName) {
          return MaterialPageRoute(builder: (context) => BestSellingView());
        }
        return MaterialPageRoute(builder: (context) => HomeBody());
      },
    );
  }
}
