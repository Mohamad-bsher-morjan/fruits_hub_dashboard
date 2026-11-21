import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
  Future<Either<Failure, void>> updateOrder({
    required OrderStatusEnum status,
    required String orderID,
  });
}
