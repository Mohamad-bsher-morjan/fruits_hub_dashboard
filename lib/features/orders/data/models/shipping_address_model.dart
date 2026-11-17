import 'package:fruit_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? address;
  String? city;
  String? phone;
  String? email;

  ShippingAddressModel({
    this.name,
    this.address,
    this.city,
    this.phone,
    this.email,
  });

  factory ShippingAddressModel.fromMap(Map<String, dynamic> map) {
    return ShippingAddressModel(
      name: map['name'],
      address: map['address'],
      city: map['city'],
      phone: map['phone'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'phone': phone,
      'email': email,
    };
  }

   ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name,
      phone: phone,
      address: address,
      city: city,
      email: email,
    );
  }
}
