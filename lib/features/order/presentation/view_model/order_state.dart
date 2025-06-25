import 'package:balanced_meal_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/food_entity.dart';

class OrderState extends Equatable {
  final BaseState vegetablesState;
  final BaseState carbsState;
  final BaseState meatsState;
  final List<FoodEntity> fetchedItems;
  final BaseState placeOrderState;

  const OrderState({
    required this.vegetablesState,
    required this.carbsState,
    required this.meatsState,
    this.fetchedItems = const [],
    required this.placeOrderState,
  });

  OrderState copyWith({
    BaseState? vegetablesState,
    BaseState? carbsState,
    BaseState? meatsState,
    List<FoodEntity>? fetchedItems,
    BaseState? placeOrderState,
  }) {
    return OrderState(
      vegetablesState: vegetablesState ?? this.vegetablesState,
      carbsState: carbsState ?? this.carbsState,
      meatsState: meatsState ?? this.meatsState,
      fetchedItems: fetchedItems ?? this.fetchedItems,
      placeOrderState: placeOrderState ?? this.placeOrderState,
    );
  }

  @override
  List<Object?> get props => [
    vegetablesState,
    carbsState,
    meatsState,
    fetchedItems,
    placeOrderState,
  ];
}

sealed class OrderActions {}

class GetVegetablesAction extends OrderActions {}

class GetCarbsAction extends OrderActions {}

class GetMeatsAction extends OrderActions {}

class IncreaseQuantityAction extends OrderActions {
  final String foodName;

  IncreaseQuantityAction(this.foodName);
}

class DecreaseQuantityAction extends OrderActions {
  final String foodName;

  DecreaseQuantityAction(this.foodName);
}

class PlaceOrderAction extends OrderActions {}
