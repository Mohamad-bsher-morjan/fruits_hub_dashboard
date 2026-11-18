import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      final data = await databaseService.getData(
        path: BackendEndpoint.getOrders,
      );

      List<OrderEntity> orders = (data as List<dynamic>)
          .map<OrderEntity>((e) => OrderModel.fromMap(e).toEntity())
          .toList();
      return Right(orders);
    } catch (e) {
      return Left(ServerFailure(errMessage: 'Failed to fetch order'));
    }
  }
}
