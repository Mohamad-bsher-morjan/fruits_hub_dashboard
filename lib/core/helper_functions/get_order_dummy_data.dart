import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

OrderEntity getDummyOrder() {
  ShippingAddressEntity shippingAddress = ShippingAddressEntity(
    name: 'John Doe',
    phone: '123-456-7890',
    address: '123 Main St',
    city: 'New York',
    email: 'johndoe@example.com',
  );

  List<OrderProductEntity> orderProducts = [
    OrderProductEntity(
      name: 'Product A',
      code: 'A123',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Product B',
      code: 'B456',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 29.99,
      quantity: 1,
    ),
    OrderProductEntity(
      name: 'Product C',
      code: 'C789',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 19.99,
      quantity: 3,
    ),
  ];

  double totalPrice = orderProducts.fold(
    0,
    (sum, product) => sum + (product.price * product.quantity),
  );

  return OrderEntity(
    totalPrice: totalPrice,
    uId: 'user123',
    shippingAddressModel: shippingAddress,
    orderProducts: orderProducts,
    paymentMethod: 'Cash',
    status: OrderStatusEnum.pending,
  );
}