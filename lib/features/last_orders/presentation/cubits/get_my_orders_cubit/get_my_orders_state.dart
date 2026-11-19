import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';

abstract class GetMyOrdersState {}

final class GetMyOrdersInitialState extends GetMyOrdersState {}

final class GetMyOrdersSuccessState extends GetMyOrdersState {
  final List<OrderEntity> listOfOrders;

  GetMyOrdersSuccessState({required this.listOfOrders});
}

final class GetMyOrdersFailureState extends GetMyOrdersState {
  final String errorMessage;

  GetMyOrdersFailureState({required this.errorMessage});
}

final class GetMyOrdersEmptyState extends GetMyOrdersState {}

final class GetMyOrdersLoadingState extends GetMyOrdersState {}
