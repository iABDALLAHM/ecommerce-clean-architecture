import 'package:ecommerce_clean_architecture/features/profile/domain/card_entity/card_entity.dart';

class CardModel {
  final String? cardHolderName;
  final String? cardNumber;
  final String? cardCvv;
  final String? cardExpiredDate;
  final String? cardImageType;
  final bool markAsDefault;
  final String? cardHolderId;

  CardModel({
    this.cardHolderName,
    this.cardNumber,
    this.cardCvv,
    this.cardExpiredDate,
    this.cardImageType,
    required this.markAsDefault,
    this.cardHolderId,
  });

  factory CardModel.fromEntity({required CardEntity cardEntity}) {
    return CardModel(
      cardHolderName: cardEntity.cardHolderName,
      cardNumber: cardEntity.cardNumber,
      cardCvv: cardEntity.cardCvv,
      cardExpiredDate: cardEntity.cardExpiredDate,
      cardImageType: cardEntity.cardImageType,
      markAsDefault: cardEntity.markAsDefault,
      cardHolderId: cardEntity.cardHolderId,
    );
  }

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      cardHolderName: json["cardHolderName"],
      cardNumber: json["cardNumber"],
      cardCvv: json["cardCvv"],
      cardExpiredDate: json["cardExpiredDate"],
      cardImageType: json["cardImageType"],
      markAsDefault: json["markAsDefault"],
      cardHolderId: json["cardHolderId"],
    );
  }

  CardEntity toEntity() {
    return CardEntity(
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
      cardCvv: cardCvv,
      cardExpiredDate: cardExpiredDate,
      markAsDefault: markAsDefault,
      cardImageType: cardImageType,
      cardHolderId: cardHolderId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "cardHolderId": cardHolderId,
      "cardHolderName": cardHolderName,
      "cardNumber": cardNumber,
      "cardCvv": cardCvv,
      "cardExpiredDate": cardExpiredDate,
      "cardImageType": cardImageType,
      "markAsDefault": markAsDefault,
    };
  }
}
