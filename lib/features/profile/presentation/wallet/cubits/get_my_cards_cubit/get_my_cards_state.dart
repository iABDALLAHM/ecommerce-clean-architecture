import 'package:ecommerce_clean_architecture/features/profile/domain/entities/card_entity/card_entity.dart';

abstract class GetMyCardsState {}

final class InitialGetMyCardsState extends GetMyCardsState {}

final class SuccessGetMyCardsState extends GetMyCardsState {
  final List<CardEntity> cardsList;

  SuccessGetMyCardsState({required this.cardsList});
}

final class FailureGetMyCardsState extends GetMyCardsState {
  final String errorMessage;

  FailureGetMyCardsState({required this.errorMessage});
}

final class LoadingGetMyCardsState extends GetMyCardsState {}
