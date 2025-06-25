import 'package:balanced_meal_app/features/order/domain/entity/food_entity.dart';
import 'package:balanced_meal_app/features/order/domain/repo/order_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_execution/api_result.dart';

@injectable
class GetMeatsUseCase {
  final OrderRepo _orderRepo;

  GetMeatsUseCase(this._orderRepo);

  Future<Result<List<FoodEntity>>> call() async {
    return await _orderRepo.getMeats();
  }
}
