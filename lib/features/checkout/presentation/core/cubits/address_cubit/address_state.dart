import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/shipping_address_entity/shipping_address_entity.dart';

abstract class AddressState {}

final class SuccessSaveAddressState extends AddressState {}

final class FailureSaveAddressState extends AddressState {
  final String errorMessage;

  FailureSaveAddressState({required this.errorMessage});
}

final class LoadingSaveAddressState extends AddressState {}

final class InitialAddressState extends AddressState {}

class GetAddressesLoadingState extends AddressState {}

class GetAddressesSuccessState extends AddressState {
  final List<ShippingAddressEntity> addresses;
  GetAddressesSuccessState({required this.addresses});
}

class GetAddressesFailureState extends AddressState {
  final String errorMessage;
  GetAddressesFailureState({required this.errorMessage});
}
