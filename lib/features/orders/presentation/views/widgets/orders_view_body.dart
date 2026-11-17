import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';

class OrdersViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24,),
          FilterSection(),
          
        ],
      ),
    );
  }
}

