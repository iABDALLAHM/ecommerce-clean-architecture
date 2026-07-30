abstract class SaveAddressState {}

final class SuccessSaveAddressState extends SaveAddressState {}

final class FailureSaveAddressState extends SaveAddressState {
  final String errorMessage;

  FailureSaveAddressState({required this.errorMessage});
}

final class LoadingSaveAddressState extends SaveAddressState {}

final class InitialSaveAddressState extends SaveAddressState {}
