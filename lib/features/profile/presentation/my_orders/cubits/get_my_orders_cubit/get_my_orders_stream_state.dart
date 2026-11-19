import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';

abstract class GetMyOrdersStreamState {}

final class SuccessGetMyOrdersStreamState extends GetMyOrdersStreamState {
  final List<OrderEntity> myOrders;

  SuccessGetMyOrdersStreamState({required this.myOrders});
}

final class EmptyOrdersState extends GetMyOrdersStreamState {}

final class FailureGetMyOrdersStreamState extends GetMyOrdersStreamState {
  final String errorMessage;

  FailureGetMyOrdersStreamState({required this.errorMessage});
}

final class LoadingGetMyOrdersStreamState extends GetMyOrdersStreamState {}
