import 'package:balanced_meal_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/food_entity.dart';

class OrderState extends Equatable {
  final BaseState vegetablesState;
  final BaseState carbsState;
  final BaseState meatsState;
  final List<FoodEntity> fetchedItems;

  const OrderState({
    required this.vegetablesState,
    required this.carbsState,
    required this.meatsState,
    this.fetchedItems = const [],
  });

  OrderState copyWith({
    BaseState? vegetablesState,
    BaseState? carbsState,
    BaseState? meatsState,
    List<FoodEntity>? fetchedItems,
  }) {
    return OrderState(
      vegetablesState: vegetablesState ?? this.vegetablesState,
      carbsState: carbsState ?? this.carbsState,
      meatsState: meatsState ?? this.meatsState,
      fetchedItems: fetchedItems ?? this.fetchedItems,
    );
  }

  @override
  List<Object?> get props => [
    vegetablesState,
    carbsState,
    meatsState,
    fetchedItems,
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
