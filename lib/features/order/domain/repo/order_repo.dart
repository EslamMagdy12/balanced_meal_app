import 'package:balanced_meal_app/core/utils/datasource_execution/api_result.dart';
import 'package:balanced_meal_app/features/order/domain/entity/food_entity.dart';

abstract class OrderRepo {
  Future<Result<List<FoodEntity>>> getVegetables();

  Future<Result<List<FoodEntity>>> getCarbs();

  Future<Result<List<FoodEntity>>> getMeats();
}
