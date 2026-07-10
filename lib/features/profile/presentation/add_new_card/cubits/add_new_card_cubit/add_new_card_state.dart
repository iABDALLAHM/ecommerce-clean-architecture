abstract class AddNewCardState {}

final class InitialAddNewCardState extends AddNewCardState {}

final class SuccessAddNewCardState extends AddNewCardState {}

final class LoadingAddNewCardState extends AddNewCardState {}

final class FailureAddNewCardState extends AddNewCardState {
  final String errorMessage;

  FailureAddNewCardState({required this.errorMessage});
}
