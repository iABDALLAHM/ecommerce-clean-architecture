import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/main/main.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_states.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/cubits/get_filter_products_cubit/get_filter_products_cubit.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<ProductsCubit, ProductsStates>(
          builder: (context, state) {
            if (state is SuccessProductsState) {
              return Text(
                "${state.products.length} نتائج",
                style: AppStyles.textStyle16Bold,
              );
            } else if (state is LoadingProductsState) {
              return Text(
                "جاري تحميل المنتجات",
                style: AppStyles.textStyle16Bold,
              );
            }
            return Text("لا يوجد منتجات", style: AppStyles.textStyle16Bold);
          },
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              useRootNavigator: true,
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<GetFilterProductsCubit>(),
                child: FilterBottomSheet(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(115, 158, 158, 158),
              ),
            ),
            child: SvgPicture.asset(Assets.imagesArrowSwapHorizontal),
          ),
        ),
      ],
    );
  }
}
