import 'package:ecommerce_clean_architecture/features/item_details/presentation/cubits/get_reviews_cubit/get_reviews_state.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/repositories/reviews_repository/reviews_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetReviewsCubit extends Cubit<GetReviewsState> {
  GetReviewsCubit({required ReviewsRepository reviewsRepository})
    : _reviewsRepository = reviewsRepository,
      super(InitialGetReviewsState());

  final ReviewsRepository _reviewsRepository;

  Future getReviews({required String productCode}) async {
    emit(LoadingGetReviewsState());
    var result = await _reviewsRepository.getAllReviewsForSpecificProduct(
      productCode: productCode,
    );

    result.fold(
      (failure) => emit(FailureGetReviewsState(errorMessage: failure.message)),
      (result) {
        if (result.isNotEmpty) {
          emit(SuccessGetReviewsState(productReviewWithUserEntity: result));
        } else {
          emit(EmptyGetReviewsState());
        }
      },
    );
  }
}
