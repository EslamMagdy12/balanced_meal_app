import 'package:balanced_meal_app/features/order/domain/entity/food_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/order_cubit.dart';
import '../../view_model/order_state.dart';
import 'circle_icon_button.dart';

class OrderSummaryItem extends StatelessWidget {
  final FoodEntity foodEntity;

  const OrderSummaryItem({super.key, required this.foodEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final cubit = context.read<OrderCubit>();
        final updatedItem = state.fetchedItems.firstWhere(
          (e) => e.foodName == foodEntity.foodName,
          orElse: () => foodEntity,
        );
        final qty = updatedItem.quantity ?? 0;
        final lineTotal = (foodEntity.price ?? 0) * qty;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: const [BoxShadow(color: Color(0x3D898989))],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: foodEntity.imageUrl != null
                      ? Image.network(foodEntity.imageUrl!, fit: BoxFit.cover)
                      : Container(color: Colors.grey.shade200),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                          '\$$lineTotal',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${foodEntity.calories} ${LocaleKeys.Cal.tr()}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Row(
                          children: [
                            CircleIconButton(
                              symbol: '-',
                              onTap: () => cubit.doIntent(
                                DecreaseQuantityAction(foodEntity.foodName!),
                              ),
                            ),

                            const SizedBox(width: 8),

                            Text(
                              qty.toString(),
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(width: 8),

                            CircleIconButton(
                              symbol: '+',
                              onTap: () => cubit.doIntent(
                                IncreaseQuantityAction(foodEntity.foodName!),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
