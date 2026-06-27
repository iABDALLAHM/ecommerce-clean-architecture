abstract class AddReviewState {}

final class InitialAddReviewState extends AddReviewState {}

final class SuccessAddReviewState extends AddReviewState {}

final class LoadingAddReviewState extends AddReviewState {}

final class FailureAddReviewState extends AddReviewState {
  final String errorMessage;

  FailureAddReviewState({required this.errorMessage});
}
