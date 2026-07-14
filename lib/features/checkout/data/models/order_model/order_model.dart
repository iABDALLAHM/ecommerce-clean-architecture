import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clean_architecture/features/checkout/data/models/order_status_model/order_status_model.dart';
import 'package:ecommerce_clean_architecture/features/checkout/data/models/product_item_model/product_item_model.dart';
import 'package:ecommerce_clean_architecture/features/checkout/data/models/shipping_address_model/shipping_address_model.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/profile/data/models/card_model/card_model.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/entities/my_order_entity/my_order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final List<ProductItemModel> products;
  final ShippingAddressModel shippingAddressModel;
  final bool payWithCash;
  final DateTime date;
  final String orderNumber;
  final OrderStatusModel orderStatusModel;
  final CardModel cardModel;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.products,
    required this.payWithCash,
    required this.date,
    required this.orderNumber,
    required this.orderStatusModel,
    required this.cardModel,
  });

  factory OrderModel.fromEntity({required OrderEntity orderEntity}) {
    return OrderModel(
      cardModel: CardModel.fromEntity(cardEntity: orderEntity.cardEntity),
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      uId: orderEntity.uId,
      shippingAddressModel: ShippingAddressModel.fromEntity(
        shippingAddressEntity: orderEntity.shippingAddressEntity,
      ),
      products: orderEntity.cartEntity.items
          .map((order) => ProductItemModel.fromEntity(cartItemEntity: order))
          .toList(),

      payWithCash: orderEntity.payWithCash ?? false,
      date: orderEntity.date,
      orderNumber: orderEntity.orderNumber,
      orderStatusModel: OrderStatusModel.fromEntity(
        orderStatusEntity: orderEntity.orderStatusEntity,
      ),
    );
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      cardModel: CardModel.fromJson(
        (json["cardModel"] as Map<String, dynamic>),
      ),
      totalPrice: json["totalPrice"],
      uId: json["uId"],
      shippingAddressModel: ShippingAddressModel.fromJson(
        (json["shippingAddressModel"] as Map<String, dynamic>),
      ),
      products: (json["products"] as List)
          .map((ele) => ProductItemModel.fromJson(ele))
          .toList(),
      payWithCash: json["payWithCash"],
      date: (json["date"] as Timestamp).toDate(),
      orderNumber: json["orderNumber"],
      orderStatusModel: OrderStatusModel.fromJson(json["orderStatusModel"]),
    );
  }

  MyOrderEntity toEntity() {
    return MyOrderEntity(
      payWithCash: payWithCash,
      products: products.map((ele) => ele.toEntity()).toList(),
      shippingAddressEntity: shippingAddressModel.toEntity(),
      uId: uId,
      date: date,
      orderNumber: orderNumber,
      orderStatusEntity: orderStatusModel.toEntity(),
      totalPrice: totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "cardModel": cardModel.toMap(),
      "orderNumber": orderNumber,
      "date": date,
      "orderStatusModel": orderStatusModel.toMap(),
      "totalPrice": totalPrice,
      "uId": uId,
      "shippingAddressModel": shippingAddressModel.toMap(),
      "products": products.map((order) => order.toMap()).toList(),
      "payWithCash": payWithCash,
    };
  }
}
