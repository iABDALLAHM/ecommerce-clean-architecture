abstract class AddFavoriteProductStates {}

final class InitialAddFavoriteProductState extends AddFavoriteProductStates {}

final class LoadingAddFavoriteProductState extends AddFavoriteProductStates {}

final class SuccessAddFavoriteProductState extends AddFavoriteProductStates {}

final class FailureAddFavoriteProductState extends AddFavoriteProductStates {
  final String errMessage;
  FailureAddFavoriteProductState({required this.errMessage});
}
