import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/cart_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/home_body_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/home_navigator.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/products_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/products_body_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  ProfileBody(),
];

class CartBodyBlocProvider extends StatelessWidget {
  const CartBodyBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: CartBody(),
    );
  }
}
