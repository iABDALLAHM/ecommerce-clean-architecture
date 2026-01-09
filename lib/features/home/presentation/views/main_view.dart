import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_button_navigaton_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/home_body_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/home_navigator.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/products_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/products_body_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_body.dart';
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
      body: SafeArea(
        child: IndexedStack(index: currentBody, children: tabs),
      ),
    );
  }
}

List<Widget> tabs = [
  HomeBodyBlocProvider(child: HomeNavigator()),
  ProductsBodyBlocProvider(child: ProductsBody()),
  CartBody(),
  ProfileBody(),
];
