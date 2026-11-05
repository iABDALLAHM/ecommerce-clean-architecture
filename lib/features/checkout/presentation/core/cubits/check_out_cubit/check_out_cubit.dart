import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/notification_service/push_notification_service.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_status_entity/order_status_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/shipping_address_entity/shipping_address_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_states.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/function/generate_order_number.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/entities/card_entity/card_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckOutCubit extends Cubit<CheckOutStates> {
  CheckOutCubit({required SecureStorageRepository secureStorageRepository})
    : _secureStorageRepository = secureStorageRepository,
      super(InitialCheckOutState());

  late OrderEntity orderEntity;
  final SecureStorageRepository _secureStorageRepository;

  void initializeOrder({
    required CartEntity cartEntity,
    required String uId,
  }) async {
    orderEntity = OrderEntity(
      uId: uId,
      cartEntity: cartEntity,
      shippingAddressEntity: ShippingAddressEntity(userId: uId),
      date: DateTime.now(),
      orderNumber: generateOrderNumber(),
      orderStatusEntity: OrderStatusEntity(),
      totalPrice: cartEntity.calculateTotalPrice(),
      cardEntity: CardEntity(),
      fcmToken: "",
    );
    emit(CheckOutLoadedState(orderEntity: orderEntity));
  }

  void updateShippingOptions({required bool payWith}) async {
    orderEntity.payWithCash = payWith;
    var token = await getIt.get<PushNotificationService>().getDeviceToken();
    orderEntity.fcmToken = token;
    emit(CheckOutLoadedState(orderEntity: orderEntity));
  }

  void updatePaymentOption({required String method}) {
    orderEntity.paymentMethod = method;
    emit(CheckOutLoadedState(orderEntity: orderEntity));
  }

  void updatePaymentCardDetails({required CardEntity cardEntity}) async {
    var userHolderId = await _secureStorageRepository.getData(key: keyUserId);
    orderEntity.cardEntity = cardEntity;
    orderEntity.cardEntity.cardHolderId = userHolderId;
    emit(CheckOutLoadedState(orderEntity: orderEntity));
  }

  void updateShippingAddress({required ShippingAddressEntity address}) {
    orderEntity.shippingAddressEntity = address;
    emit(CheckOutLoadedState(orderEntity: orderEntity));
  }
}
