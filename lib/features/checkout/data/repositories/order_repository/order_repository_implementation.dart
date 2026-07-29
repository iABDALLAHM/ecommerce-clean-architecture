import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/core/models/query_prams.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';
import 'package:ecommerce_clean_architecture/features/checkout/data/models/order_model/order_model.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrdersRepository)
class OrderRepositoryImplementation implements OrdersRepository {
  final DatabaseService databaseService;

  OrderRepositoryImplementation({required this.databaseService});

  @override
  Future<Either<Failure, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      await databaseService.addData(
        path: BackendEndPoints.ordersCollection,
        data: OrderModel.fromEntity(orderEntity: orderEntity).toMap(),
      );
      return Right(null);
    } on CustomException catch (e) {
      log(
        "This Error in OrderRepoImplementation in add Order method ${e.toString()}",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Stream<List<OrderEntity>> getOrders({required String userId}) {
    return databaseService
        .getQueryStreamData(
          path: BackendEndPoints.ordersCollection,
          query: QueryParams(
            condition: QueryCondition(field: "uId", isEqualTo: userId),
          ),
        )
        .map((docsList) {
          final myOrdersList = (docsList as List)
              .map((doc) => OrderModel.fromJson(doc).toEntity())
              .toList();

          return myOrdersList;
        });
  }
}
