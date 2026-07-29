import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/repositories/reviews_repository/reviews_repository.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/domain/entities/entities/product_review_entity/product_review_entity.dart';
import 'package:ecommerce_clean_architecture/features/review_and_rating/presentation/cubits/add_review_cubit/add_review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit({
    required ReviewsRepository reviewsRepository,
    required SecureStorageRepository secureStorageRepository,
  }) : _reviewsRepository = reviewsRepository,
       _secureStorageRepository = secureStorageRepository,
       super(InitialAddReviewState());

  final ReviewsRepository _reviewsRepository;
  final SecureStorageRepository _secureStorageRepository;

  Future<void> addReview({
    required String productCode,
    required DateTime date,
    required String reviewerMessage,
    required double reviewerRating,
  }) async {
    var userId = await _secureStorageRepository.getData(key: keyUserId);
    emit(LoadingAddReviewState());

    ProductReviewEntity productReviewEntity = ProductReviewEntity(
      productCode: productCode,
      reviewDate: date,
      reviewerMessage: reviewerMessage,
      reviewerRating: reviewerRating,
      reviewerUid: userId,
    );
    var result = await _reviewsRepository.addReview(
      productReviewEntity: productReviewEntity,
    );

    result.fold(
      (failure) => emit(FailureAddReviewState(errorMessage: failure.message)),
      (success) => emit(SuccessAddReviewState()),
    );
  }
}
