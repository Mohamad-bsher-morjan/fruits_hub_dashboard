import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/cubits/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_view_body_builder.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = 'orders';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchOrdersCubit(ordersRepo: getIt.get<OrdersRepo>())..fetchOrders(),
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Orders')),
        body: const OrderViewBodyBuilder(),
      ),
    );
  }
}
