import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const new({super.key});
  static const routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrdersViewBody());
  }
}
