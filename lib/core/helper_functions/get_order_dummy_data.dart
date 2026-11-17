import 'package:fruit_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/shipping_address_model.dart';

OrderModel getDummyOrder() {
  ShippingAddressModel shippingAddress = ShippingAddressModel(
    name: 'John Doe',
    phone: '123-456-7890',
    address: '123 Main St',
    city: 'New York',
    email: 'johndoe@example.com',
  );

  List<OrderProductModel> orderProducts = [
    OrderProductModel(
      name: 'Product A',
      code: 'A123',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductModel(
      name: 'Product B',
      code: 'B456',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 29.99,
      quantity: 1,
    ),
    OrderProductModel(
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

  return OrderModel(
    totalPrice: totalPrice,
    uId: 'user123',
    shippingAddress: shippingAddress,
    orderProducts: orderProducts,
    paymentMethod: 'Cash',
    status: OrderStatus.pending,
  );
}