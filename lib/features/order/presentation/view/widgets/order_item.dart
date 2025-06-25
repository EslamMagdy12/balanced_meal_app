import 'package:balanced_meal_app/features/order/domain/entity/food_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/order_cubit.dart';
import '../../view_model/order_state.dart';
import 'circle_icon_button.dart';

class OrderItem extends StatelessWidget {
  final FoodEntity foodEntity;

  const OrderItem({super.key, required this.foodEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final cubit = context.read<OrderCubit>();

        final updatedItem = state.fetchedItems.firstWhere(
          (e) => e.foodName == foodEntity.foodName,
          orElse: () => foodEntity,
        );
        final quantity = updatedItem.quantity ?? 0;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: const [BoxShadow(color: Color(0x3D898989))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: foodEntity.imageUrl != null
                        ? DecorationImage(
                            image: NetworkImage(foodEntity.imageUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: Colors.black.withAlpha(100),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      foodEntity.foodName!,
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${foodEntity.calories} ${LocaleKeys.Cal.tr()}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${foodEntity.price}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 36, // Fixed height to keep layout consistent
                    child: Center(
                      child: quantity == 0
                          ? ElevatedButton(
                              onPressed: () => cubit.doIntent(
                                IncreaseQuantityAction(foodEntity.foodName!),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                              ),
                              child: Text(LocaleKeys.Add.tr()),
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleIconButton(
                                  symbol: '-',
                                  onTap: () => cubit.doIntent(
                                    DecreaseQuantityAction(
                                      foodEntity.foodName!,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  quantity.toString(),
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                CircleIconButton(
                                  symbol: '+',
                                  onTap: () => cubit.doIntent(
                                    IncreaseQuantityAction(
                                      foodEntity.foodName!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
