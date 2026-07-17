import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';

abstract class GetMyOrdersState {}

final class SuccessGetMyOrdersState extends GetMyOrdersState {
  final List<OrderEntity> myOrders;

  SuccessGetMyOrdersState({required this.myOrders});
}

final class EmptyOrdersState extends GetMyOrdersState {}

final class FailureGetMyOrdersState extends GetMyOrdersState {
  final String errorMessage;

  FailureGetMyOrdersState({required this.errorMessage});
}

final class LoadingGetMyOrdersState extends GetMyOrdersState {}
