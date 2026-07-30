abstract class AddressState {}

final class SuccessAddressState extends AddressState {}

final class FailureAddressState extends AddressState {
  final String errorMessage;

  FailureAddressState({required this.errorMessage});
}

final class LoadingAddressState extends AddressState {}

final class InitialAddressState extends AddressState {}
