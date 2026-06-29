import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/views/fruit_item_details_view.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitItemDetailsWrapper extends StatelessWidget {
  const FruitItemDetailsWrapper({super.key, required this.data});

  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: data["CartCubit"] as CartCubit,
      child: FruitItemDetailsView(
        productEntity: data["ProductEntity"] as ProductEntity,
      ),
    );
  }
}
