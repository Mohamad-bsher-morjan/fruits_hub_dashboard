part of 'fetch_orders_cubit.dart';

@immutable
abstract class FetchOrdersState {}

final class FetchOrdersInitial extends FetchOrdersState {}

final class FetchOrdersLoading extends FetchOrdersState {}

final class FetchOrdersSuccess extends FetchOrdersState {
  final List<OrderEntity> orders;

  new({required this.orders});
}

final class FetchOrdersFailure extends FetchOrdersState {
  final String errMessage;

  new({required this.errMessage});
}
