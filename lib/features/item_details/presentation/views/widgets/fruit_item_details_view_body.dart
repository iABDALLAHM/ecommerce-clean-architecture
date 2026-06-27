import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/views/widgets/fruit_item_details_header.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/views/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitItemDetailsViewBody extends StatefulWidget {
  const FruitItemDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<FruitItemDetailsViewBody> createState() =>
      _FruitItemDetailsViewBodyState();
}

class _FruitItemDetailsViewBodyState extends State<FruitItemDetailsViewBody> {
  
  @override
  void initState() {
    context.read<GetReviewsCubit>().getReviews(
      productCode: widget.productEntity.productCode,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: height * 0.5,
            width: width,
            child: FruitItemDetailsHeader(
              imageUrl: widget.productEntity.productImageUrl,
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: ProductInfo(productEntity: widget.productEntity),
          ),
        ),
      ],
    );
  }
}
