import 'package:balanced_meal_app/features/order/domain/entity/food_entity.dart';
import 'package:balanced_meal_app/features/order/presentation/view/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/base/base_state.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderSectionList extends StatelessWidget {
  final BaseState orderState;

  const OrderSectionList({super.key, required this.orderState});

  @override
  Widget build(BuildContext context) {
    if (orderState is BaseErrorState) {
      return Text(
        (orderState as BaseErrorState).errorMessage,
        style: const TextStyle(color: AppColors.red),
      );
    }

    final isLoading = orderState is BaseLoadingState;
    final foods = orderState is BaseSuccessState<List<FoodEntity>>
        ? (orderState as BaseSuccessState<List<FoodEntity>>).data
        : List.generate(
            6,
            (index) => FoodEntity(foodName: LocaleKeys.Loading.tr()),
          );

    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: foods!.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final food = foods[index];
          return SizedBox(
            width: 200,
            child: Skeletonizer(
              enabled: isLoading,
              child: OrderItem(foodEntity: food),
            ),
          );
        },
      ),
    );
  }
}
