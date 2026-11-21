import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit({required this.ordersRepo}) : super(FetchOrdersInitial());
  final OrdersRepo ordersRepo;

  StreamSubscription? streamSubscription;
  void fetchOrders() {
    emit(FetchOrdersLoading());
    streamSubscription = ordersRepo.fetchOrders().listen((result) {
      result.fold(
        (l) {
          emit(FetchOrdersFailure(errMessage: l.errMessage));
        },
        (r) {
          emit(FetchOrdersSuccess(orders: r));
        },
      );
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
