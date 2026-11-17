
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final double price;
  final int quantity;
  final String imageUrl;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });


  factory OrderProductModel.fromMap(Map<String, dynamic> map) {
    return OrderProductModel(
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      imageUrl: map['imageUrl'] ?? '',
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  
OrderProductEntity toEntity(){
  return OrderProductEntity(
    name: name,
    code: code,
    price: price,
    quantity: quantity,
    imageUrl: imageUrl,
  );
}
}

