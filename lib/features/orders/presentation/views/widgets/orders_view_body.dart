import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});
final List<OrderEntity> orders; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const FilterSection(),
          Expanded(
            child: OrderItemsListView(
              orderModels: orders,
            ),
          ),
        ],
      ),
    );
  }
}
