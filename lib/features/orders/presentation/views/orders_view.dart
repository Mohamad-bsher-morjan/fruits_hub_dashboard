import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Orders')),
      body: OrdersViewBody(),
    );
  }
}
