abstract class PaymentService {
  Future<void> init();
  Future<void> pay({required int amount, required String currency});
}
