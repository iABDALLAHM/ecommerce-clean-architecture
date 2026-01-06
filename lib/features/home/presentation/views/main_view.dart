import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_button_navigaton_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/home_products_body.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = "Main";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentBody = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onChange: (value) {
          currentBody = value;
          setState(() {});
        },
      ),
      body: homeBody[currentBody],
    );
  }
}

List<Widget> homeBody = [
  HomeProductsBody(),
  Placeholder(),
  Placeholder(),
  Placeholder(),
];
