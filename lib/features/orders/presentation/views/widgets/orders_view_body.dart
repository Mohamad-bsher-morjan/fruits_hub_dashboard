import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/get_order_dummy_data.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
         const SizedBox(height: 12,),
         const FilterSection(),
          Expanded(child: OrderItemsListView(orderModels: [getDummyOrder(),getDummyOrder(),]),)
          
        ],
      ),
    );
  }
}

