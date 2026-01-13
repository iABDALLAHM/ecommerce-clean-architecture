import 'package:ecommerce_clean_architecture/core/cubits/get_favorite_products_cubit/get_favorite_product_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_favorite_products_cubit/get_favorite_product_states.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/sliver_list_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePageBody extends StatefulWidget {
  const FavoritePageBody({super.key});

  @override
  State<FavoritePageBody> createState() => _FavoritePageBodyState();
}

class _FavoritePageBodyState extends State<FavoritePageBody> {
  @override
  void initState() {
    context.read<GetFavoriteProductCubit>().getFavoriteProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoriteProductCubit, GetFavoriteProductStates>(
      builder: (context, state) {
        if (state is SuccessGetFavoriteProductState) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: const SizedBox(height: 24)),
              SliverListItems(products: state.productsList),
            ],
          );
        } else {
          return Center(child: Text("لا يوجد منتجات مفضلة لديك"));
        }
      },
    );
  }
}
