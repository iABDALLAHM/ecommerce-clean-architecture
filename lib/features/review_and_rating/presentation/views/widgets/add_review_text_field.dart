import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/add_review_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddReviewTextField extends StatelessWidget {
  const AddReviewTextField({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) {
            final addReviewsCubit = context.read<AddReviewCubit>();
            final getReviewsCubit = context.read<GetReviewsCubit>();
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(value: addReviewsCubit),
                BlocProvider.value(value: getReviewsCubit),
              ],
              child: AddReviewBottomSheet(productEntity: productEntity),
            );
          },
        );
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundColor: AppColors.lightsecondryColor,
            radius: 15,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              child: Image.network(
                getUserData().userImage,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person);
                },
              ),
            ),
          ),
        ),
        hintText: "اكتب التعليق..",
        hintStyle: AppStyles.textStyle13Regular,
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Color(0xffEEEEEE)),
  );
}
