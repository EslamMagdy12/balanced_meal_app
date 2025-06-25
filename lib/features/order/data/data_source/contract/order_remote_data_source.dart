import 'package:balanced_meal_app/features/order/data/models/food_response_dto.dart';

abstract class OrderRemoteDataSource {
  Future<List<FoodResponseDto>> getVegetables();

  Future<List<FoodResponseDto>> getCarbs();

  Future<List<FoodResponseDto>> getMeats();
}
