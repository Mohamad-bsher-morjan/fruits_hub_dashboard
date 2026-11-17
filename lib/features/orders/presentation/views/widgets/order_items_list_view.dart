import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';

class OrderItemsListView extends StatelessWidget {
  const new({super.key, required this.orderModels});
  final List<OrderModel> orderModels;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderModels.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(orderModel: orderModels[index]);
      },
    );
  }
}
