import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/get_order_dummy_data.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_snack_bar.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/cubits/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderViewBodyBuilder extends StatelessWidget {
  const OrderViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrdersFailure) {
          CustomSnackBar.showError(context, message: state.errMessage);
          return const SizedBox.shrink();
        } else {
          return Skeletonizer(
            child: OrdersViewBody(orders: [getDummyOrder(), getDummyOrder()]),
          );
        }
      },
    );
  }
}
