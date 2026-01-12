import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_body_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/home_body_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/home_navigator.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/products_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/products_body_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_body_navigator.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentBody});

  final int currentBody;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: currentBody, children: tabs);
  }
}

List<Widget> tabs = [
  HomeBodyBlocProvider(child: HomeNavigator()),
  ProductsBodyBlocProvider(child: ProductsBody()),
  CartBodyBlocProvider(),
  ProfileBodyNavigator(),
];
