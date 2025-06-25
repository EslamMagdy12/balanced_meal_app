import 'package:balanced_meal_app/core/assets/app_colors.dart';
import 'package:balanced_meal_app/core/utils/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/order_cubit.dart';
import '../../view_model/order_state.dart';

class OrderSummary extends StatelessWidget {
  final double userCaloriesRequired;
  final String buttonLabel;
  final VoidCallback onConfirmed;

  const OrderSummary({
    super.key,
    required this.userCaloriesRequired,
    required this.buttonLabel,
    required this.onConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final cubit = context.read<OrderCubit>();
        final totalCalories = cubit.totalCalories.toDouble();
        final totalPrice = cubit.totalPrice.toDouble();

        final tolerance = userCaloriesRequired * 0.1;
        final withinCalorieRange =
            (totalCalories - userCaloriesRequired).abs() <= tolerance;

        final canPlace = withinCalorieRange && totalPrice > 0;

        return Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.Cal.tr(),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: AppColors.darkGray),
                  ),
                  Text(
                    '${totalCalories.toStringAsFixed(2)} '
                    '${LocaleKeys.CalOutOf.tr()} '
                    '${userCaloriesRequired.toStringAsFixed(2)} '
                    '${LocaleKeys.Cal.tr()}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.mediumGray,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.Price.tr(),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: AppColors.darkGray),
                  ),
                  Text(
                    '\$$totalPrice',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: AppColors.orange),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: canPlace ? onConfirmed : null,
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStateProperty.all(
                    canPlace ? AppColors.orange : AppColors.lightBlue,
                  ),
                ),
                child: Text(buttonLabel),
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
