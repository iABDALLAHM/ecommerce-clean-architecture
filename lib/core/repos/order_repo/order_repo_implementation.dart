import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/repos/order_repo/orders_repo.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';
import 'package:ecommerce_clean_architecture/features/checkout/data/models/order_model.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';

class OrderRepoImplementation implements OrdersRepo {
  final DatabaseService databaseService;
  OrderRepoImplementation({required this.databaseService});
  @override
  Future<Either<Failure, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      await databaseService.addData(
        path: BackendEndPoints.addOrders,
        data: OrderModel.fromEntity(orderEntity: orderEntity).toMap(),
        documentId: orderEntity.uId,
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
