import 'package:balanced_meal_app/core/utils/datasource_execution/api_manager.dart';
import 'package:balanced_meal_app/core/utils/datasource_execution/api_result.dart';
import 'package:balanced_meal_app/features/order/data/data_source/contract/order_remote_data_source.dart';
import 'package:balanced_meal_app/features/order/data/models/place_order_request_dto.dart';
import 'package:balanced_meal_app/features/order/domain/entity/food_entity.dart';
import 'package:balanced_meal_app/features/order/domain/repo/order_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrderRepo)
class OrderRepoImpl implements OrderRepo {
  final ApiManager _apiManager;
  final OrderRemoteDataSource _orderRemoteDataSource;

  OrderRepoImpl(this._apiManager, this._orderRemoteDataSource);

  @override
  Future<Result<List<FoodEntity>>> getCarbs() async {
    final result = await _apiManager.execute<List<FoodEntity>>(() async {
      final response = await _orderRemoteDataSource.getCarbs();
      return response.map((carb) => carb.toEntity()).toList();
    });
    return result;
  }

  @override
  Future<Result<List<FoodEntity>>> getMeats() async {
    final result = await _apiManager.execute<List<FoodEntity>>(() async {
      final response = await _orderRemoteDataSource.getMeats();
      return response.map((meat) => meat.toEntity()).toList();
    });
    return result;
  }

  @override
  Future<Result<List<FoodEntity>>> getVegetables() async {
    final result = await _apiManager.execute<List<FoodEntity>>(() async {
      final response = await _orderRemoteDataSource.getVegetables();
      return response.map((vegetable) => vegetable.toEntity()).toList();
    });
    return result;
  }

  @override
  Future<Result<void>> placeOrder(PlaceOrderRequestDto requestDto) async {
    final result = await _apiManager.execute<void>(() async {
      await _orderRemoteDataSource.placeOrder(requestDto);
    });
    return result;
  }
}
