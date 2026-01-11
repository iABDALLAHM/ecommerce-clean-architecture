abstract class AddOrderStates {}

final class InitialAddOrderState extends AddOrderStates {}

final class SuccessAddOrderState extends AddOrderStates {}

final class LoadingAddOrderState extends AddOrderStates {}

final class FailureAddOrderState extends AddOrderStates {}
