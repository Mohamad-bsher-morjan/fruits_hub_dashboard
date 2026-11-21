import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/services/data_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl extends OrdersRepo {
  final DatabaseService databaseService;

  new({required this.databaseService});
  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data in databaseService.streamData(
        path: BackendEndpoint.getOrders,
      )) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromMap(e).toEntity())
            .toList();
        yield Right(orders);
      } //await for if u have more than result u want to have
    } catch (e) {
      yield Left(ServerFailure(errMessage: 'Failed to fetch order'));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder({
    required OrderStatusEnum status,
    required String orderID,
  }) async {
    try {
      await databaseService.updateData(BackendEndpoint.updateOrder,{
         'status':status.name
      }, orderID);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: 'Failed to update order'));
    }
  }
}
