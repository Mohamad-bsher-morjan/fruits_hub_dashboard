import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
   String? status;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      totalPrice: map['totalPrice'],
      uId: map['uId'],
      shippingAddressModel: ShippingAddressModel.fromMap(
        map['shippingAddress'],
      ),
      orderProducts: List<OrderProductModel>.from(
        map['orderProducts'].map((e) => OrderProductModel.fromMap(e)),
      ),

      paymentMethod: map['paymentMethod'] ?? '',
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'status': status,
      'date': DateTime.now().toString(),
      'shippingAddress': shippingAddressModel.toMap(),
      'orderProducts': orderProducts.map((x) => x.toMap()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  OrderEntity toEntity() {
    return OrderEntity(
      totalPrice: totalPrice,
      uId: uId,
      shippingAddressModel: shippingAddressModel.toEntity(),
      orderProducts: orderProducts.map((x) => x.toEntity()).toList(),
      paymentMethod: paymentMethod,
      status: fetchEnum(),
    );
  }

  OrderEnum fetchEnum() {
    return OrderEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}
