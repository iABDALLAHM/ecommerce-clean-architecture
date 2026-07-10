import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/errors/failures.dart';
import 'package:ecommerce_clean_architecture/core/errors/server_failure.dart';
import 'package:ecommerce_clean_architecture/core/models/query_prams.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/backend_end_points.dart';
import 'package:ecommerce_clean_architecture/features/profile/data/models/card_model/card_model.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/card_entity/card_entity.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/repositories/payment_repository/payment_repository.dart';

class PaymentRepositoryImplementation implements PaymentRepository {
  PaymentRepositoryImplementation({required DatabaseService databaseService})
    : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  Future<Either<Failure, void>> addNewCard({required CardEntity card}) async {
    try {
      await _databaseService.addData(
        path: BackendEndPoints.addCards,
        data: CardModel.fromEntity(cardEntity: card).toMap(),
      );
      return Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, List<CardEntity>>> getMyCards({
    required String uId,
  }) async {
    try {
      var result = await _databaseService.getQueryData(
        path: BackendEndPoints.addCards,
        query: QueryParams(
          condition: QueryCondition(field: "cardHolderId", isEqualTo: uId),
        ),
      );

      List<CardEntity> cardsList = [];

      for (var card in result) {
        cardsList.add(CardModel.fromJson(card).toEntity());
      }
      return Right(cardsList);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
