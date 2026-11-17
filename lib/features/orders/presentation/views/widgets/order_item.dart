import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/order_model.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModel orderModel;

  const OrderItemWidget({super.key, required this.orderModel});

  Color _statusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.accepted:
        return Colors.green;
      case OrderStatus.delivered:
        return Colors.blue;
      case OrderStatus.rejected:
        return Colors.red;
      case OrderStatus.pending:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final address = orderModel.shippingAddress;
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Total Price: \$${orderModel.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _statusColor(orderModel.status),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    orderModel.status.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'User ID: ${orderModel.uId}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Shipping Address:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '${address.name ?? ''}\n'
              '${address.address ?? ''}, ${address.city ?? ''}\n'
              '${address.phone ?? ''}\n'
              '${address.email ?? ''}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              'Payment Method: ${orderModel.paymentMethod}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              'Products:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderModel.orderProducts.length,
              itemBuilder: (context, index) {
                final product = orderModel.orderProducts[index];
                return ListTile(
                  leading: Image.network(
                    product.imageUrl,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    'Quantity: ${product.quantity} | Price: \$${product.price.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}