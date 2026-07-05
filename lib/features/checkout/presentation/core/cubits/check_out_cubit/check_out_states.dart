import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';

abstract class CheckOutStates {}

final class InitialCheckOutState extends CheckOutStates {}

final class CheckOutLoadedState extends CheckOutStates {
  final OrderEntity orderEntity;

  CheckOutLoadedState({required this.orderEntity});
}
