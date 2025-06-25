import 'package:balanced_meal_app/core/base/base_state.dart';
import 'package:balanced_meal_app/core/utils/datasource_execution/api_result.dart';
import 'package:balanced_meal_app/features/order/domain/entity/food_entity.dart';
import 'package:balanced_meal_app/features/order/domain/use_case/get_vegetables_use_case.dart';
import 'package:balanced_meal_app/features/order/domain/use_case/place_order_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/items_dto.dart';
import '../../data/models/place_order_request_dto.dart';
import '../../domain/use_case/get_carbs_use_case.dart';
import '../../domain/use_case/get_meats_use_case.dart';
import 'order_state.dart';

@injectable
class OrderCubit extends Cubit<OrderState> {
  final GetVegetablesUseCase _getVegetablesUseCase;
  final GetCarbsUseCase _getCarbsUseCase;
  final GetMeatsUseCase _getMeatsUseCase;
  final PlaceOrderUseCase _placeOrderUseCase;

  final List<FoodEntity> fetchedFoods = [];

  OrderCubit(
    this._getVegetablesUseCase,
    this._getCarbsUseCase,
    this._getMeatsUseCase,
    this._placeOrderUseCase,
  ) : super(
        OrderState(
          vegetablesState: BaseInitialState(),
          carbsState: BaseInitialState(),
          meatsState: BaseInitialState(),
          placeOrderState: BaseInitialState(),
        ),
      );

  void doIntent(OrderActions action) {
    switch (action) {
      case GetVegetablesAction():
        _getVegetables();
      case GetCarbsAction():
        _getCarbs();
      case GetMeatsAction():
        _getMeats();
      case IncreaseQuantityAction():
        _increaseQuantity(action.foodName);
      case DecreaseQuantityAction():
        _decreaseQuantity(action.foodName);
      case PlaceOrderAction():
        _placeOrder();
    }
  }

  void _increaseQuantity(String foodName) {
    final index = state.fetchedItems.indexWhere((e) => e.foodName == foodName);
    if (index == -1) return;

    final current = state.fetchedItems[index];
    final updatedItem = FoodEntity(
      foodName: current.foodName,
      calories: current.calories,
      imageUrl: current.imageUrl,
      price: current.price,
      quantity: (current.quantity ?? 0) + 1,
    );

    final updatedList = [...state.fetchedItems];
    updatedList[index] = updatedItem;

    emit(state.copyWith(fetchedItems: updatedList));
  }

  void _decreaseQuantity(String foodName) {
    final index = state.fetchedItems.indexWhere((e) => e.foodName == foodName);
    if (index == -1) return;

    final current = state.fetchedItems[index];
    final newQty = (current.quantity ?? 0) - 1;
    final updatedItem = FoodEntity(
      foodName: current.foodName,
      calories: current.calories,
      imageUrl: current.imageUrl,
      price: current.price,
      quantity: newQty < 0 ? 0 : newQty,
    );

    final updatedList = [...state.fetchedItems];
    updatedList[index] = updatedItem;

    emit(state.copyWith(fetchedItems: updatedList));
  }

  int get totalCalories {
    return state.fetchedItems
        .where((e) => (e.quantity ?? 0) > 0)
        .fold(
          0,
          (sum, item) => sum + (item.calories ?? 0) * (item.quantity ?? 0),
        );
  }

  int get totalPrice {
    return state.fetchedItems
        .where((e) => (e.quantity ?? 0) > 0)
        .fold(0, (sum, item) => sum + (item.price ?? 0) * (item.quantity ?? 0));
  }

  Future<void> _getVegetables() async {
    emit(state.copyWith(vegetablesState: BaseLoadingState()));
    final result = await _getVegetablesUseCase();
    switch (result) {
      case SuccessResult<List<FoodEntity>>():
        final combined = [...state.fetchedItems, ...result.data];
        emit(
          state.copyWith(
            vegetablesState: BaseSuccessState(data: result.data),
            fetchedItems: combined,
          ),
        );
        break;
      case FailureResult<List<FoodEntity>>():
        emit(
          state.copyWith(
            vegetablesState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _getCarbs() async {
    emit(state.copyWith(carbsState: BaseLoadingState()));
    final result = await _getCarbsUseCase();
    switch (result) {
      case SuccessResult<List<FoodEntity>>():
        final combined = [...state.fetchedItems, ...result.data];
        emit(
          state.copyWith(
            carbsState: BaseSuccessState(data: result.data),
            fetchedItems: combined,
          ),
        );
        break;
      case FailureResult<List<FoodEntity>>():
        emit(
          state.copyWith(
            carbsState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _getMeats() async {
    emit(state.copyWith(meatsState: BaseLoadingState()));
    final result = await _getMeatsUseCase();
    switch (result) {
      case SuccessResult<List<FoodEntity>>():
        final combined = [...state.fetchedItems, ...result.data];
        emit(
          state.copyWith(
            meatsState: BaseSuccessState(data: result.data),
            fetchedItems: combined,
          ),
        );
        break;
      case FailureResult<List<FoodEntity>>():
        emit(
          state.copyWith(
            meatsState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _placeOrder() async {
    final selectedItems = state.fetchedItems
        .where((e) => (e.quantity ?? 0) > 0)
        .toList();

    final request = PlaceOrderRequestDto(
      items: selectedItems
          .map(
            (e) => ItemsDto(
              name: e.foodName,
              quantity: e.quantity,
              totalPrice: (e.price ?? 0) * (e.quantity ?? 0),
            ),
          )
          .toList(),
    );
    emit(state.copyWith(placeOrderState: BaseLoadingState()));
    final result = await _placeOrderUseCase(request);
    switch (result) {
      case SuccessResult<void>():
        emit(state.copyWith(placeOrderState: BaseSuccessState()));
        break;
      case FailureResult<void>():
        emit(
          state.copyWith(
            placeOrderState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }
}
