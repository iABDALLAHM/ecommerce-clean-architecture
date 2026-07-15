import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/secure_storage_service/secure_storage_service.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_entity/product_review_entity.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_state.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/custom_review_text_field.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/views/widgets/stars_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddReviewBottomSheet extends StatefulWidget {
  const AddReviewBottomSheet({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  State<AddReviewBottomSheet> createState() => _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  String message = "";
  int rating = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomReviewTextField(
                  onSaved: (value) {
                    message = value ?? "";
                  },
                ),

                const SizedBox(height: 20),

                StarsRating(
                  onRatingChanged: (newRating) {
                    setState(() {
                      rating = newRating;
                    });
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: BlocListener<AddReviewCubit, AddReviewState>(
                    listener: (context, state) {
                      if (state is SuccessAddReviewState) {
                        showSnackBar(context, message: "تم اضافة تقيمك بنجاح");
                        context.pop();
                        context.read<GetReviewsCubit>().getReviews(
                          productCode: widget.productEntity.productCode,
                        );
                      } else if (state is LoadingAddReviewState) {
                        showSnackBar(context, message: "جاري إضافة تقيمك");
                      } else if (state is FailureAddReviewState) {
                        showSnackBar(context, message: state.errorMessage);
                      }
                    },
                    child: CustomButton(
                      text: "اضافة تقيم",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          await _triggerAddReviewCubit(context);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _triggerAddReviewCubit(BuildContext context) async {
    final ProductReviewEntity productReviewEntity = ProductReviewEntity(
      productCode: widget.productEntity.productCode,
      reviewDate: DateTime.now(),
      reviewerMessage: message,
      reviewerRating: rating.toDouble(),
      reviewerUid: await getIt.get<SecureStorageService>().getData(
        key: SecureStorageService.keyUserId,
      ),
    );

    context.read<AddReviewCubit>().addReview(
      productReviewEntity: productReviewEntity,
    );
  }
}
