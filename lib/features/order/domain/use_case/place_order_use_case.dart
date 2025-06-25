import 'package:balanced_meal_app/core/utils/datasource_execution/api_result.dart';
import 'package:balanced_meal_app/features/order/domain/repo/order_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/place_order_request_dto.dart';

@injectable
class PlaceOrderUseCase {
  final OrderRepo _orderRepo;

  PlaceOrderUseCase(this._orderRepo);

  Future<Result<void>> call(PlaceOrderRequestDto requestDto) async {
    return await _orderRepo.placeOrder(requestDto);
  }
}
