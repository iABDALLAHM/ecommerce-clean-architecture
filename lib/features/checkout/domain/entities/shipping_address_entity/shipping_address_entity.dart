class ShippingAddressEntity {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? addressDetails;
  String? city;
  bool saveLocation;

  ShippingAddressEntity({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.addressDetails,
    this.city,
    this.saveLocation = false,
  });

  @override
  String toString() {
    return "$addressDetails $city $address $name $email $phone $saveLocation";
  }
}
