
import 'package:fruit_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final String uID;
  // final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;
  OrderEntity({
    // required this.cartEntity,
    this.payWithCash,
    required this.shippingAddressEntity,
    required this.uID,
  });

  int calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double calculateShippingDisscount() {
    return 0;
  }

  // double calculateTotalPriceAfterDiscountAndShipping() {
  //   return cartEntity.calculateTotalPrice() +
  //       calculateShippingCost() -
  //       calculateShippingDisscount();
  // }
 
}
