import 'package:fruit_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/shipping_address_model.dart';

enum OrderStatus { pending, accepted, rejected, delivered }

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final OrderStatus status;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
    this.status = OrderStatus.pending,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
      uId: map['uId'] ?? '',
      shippingAddress: ShippingAddressModel.fromMap(map['shippingAddress']),
      orderProducts: List<OrderProductModel>.from(
        (map['orderProducts'] as List<dynamic>).map<OrderProductModel>(
          (x) => OrderProductModel.fromMap(x),
        ),
      ),
      paymentMethod: map['paymentMethod'] ?? '',
      status: OrderStatus.values.firstWhere(
        (status) => status.name == map['status'],
        orElse: () => OrderStatus.pending,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'status': status.name,
      'date': DateTime.now().toString(),
      'shippingAddress': shippingAddress.toMap(),
      'orderProducts': orderProducts.map((x) => x.toMap()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
