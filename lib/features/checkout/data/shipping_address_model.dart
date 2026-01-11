import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? addressDetails;
  String? city;

  ShippingAddressModel({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.addressDetails,
    this.city,
  });

  factory ShippingAddressModel.fromEntity({
    required ShippingAddressEntity shippingAddressEntity,
  }) {
    return ShippingAddressModel(
      name: shippingAddressEntity.name,
      email: shippingAddressEntity.email,
      phone: shippingAddressEntity.phone,
      address: shippingAddressEntity.address,
      addressDetails: shippingAddressEntity.addressDetails,
      city: shippingAddressEntity.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "addressDetails": addressDetails,
      "city": city,
    };
  }
}
