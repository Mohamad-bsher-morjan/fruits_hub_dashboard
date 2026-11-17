class ShippingAddressEntity {
  String? name, address, city, phone, email;

  ShippingAddressEntity({
    this.name,
    this.address,
    this.city,
    this.phone,
    this.email,
  });
  @override
  String toString() {
    return '$address _$city';
  }
}
