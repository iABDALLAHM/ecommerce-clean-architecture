class CardEntity {
  String? cardHolderName;
  String? cardNumber;
  String? cardCvv;
  String? cardExpiredDate;
  String? cardImageType;
  bool markAsDefault;
  String? cardHolderId;

  CardEntity({
    this.cardHolderName,
    this.cardNumber,
    this.cardCvv,
    this.cardExpiredDate,
    this.markAsDefault = false,
    this.cardImageType,
    this.cardHolderId,
  });
}
