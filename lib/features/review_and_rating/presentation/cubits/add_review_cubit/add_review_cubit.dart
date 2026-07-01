import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/repositories/reviews_repository/reviews_repository.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/review_entity/product_review_entity.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit({required ReviewsRepository reviewsRepository})
    : _reviewsRepository = reviewsRepository,
      super(InitialAddReviewState());

  final ReviewsRepository _reviewsRepository;

  Future<void> addReview({
    required ProductReviewEntity productReviewEntity,
  }) async {
    emit(LoadingAddReviewState());
    var result = await _reviewsRepository.addReview(
      productReviewEntity: productReviewEntity,
    );

    result.fold(
      (failure) => emit(FailureAddReviewState(errorMessage: failure.message)),
      (success) => emit(SuccessAddReviewState()),
    );
  }
}
