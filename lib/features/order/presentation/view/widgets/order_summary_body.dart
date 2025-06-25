import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/order_cubit.dart';
import '../../view_model/order_state.dart';
import 'confirm_place_order_summary.dart';
import 'order_summary_item.dart';

class OrderSummaryBody extends StatelessWidget {
  final double userRequiredCalories;

  const OrderSummaryBody({super.key, required this.userRequiredCalories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final selectedItems = state.fetchedItems
            .where((item) => (item.quantity ?? 0) > 0)
            .toList();

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: selectedItems.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final foodEntity = selectedItems[index];
                    return OrderSummaryItem(foodEntity: foodEntity);
                  },
                ),
              ),
              const SizedBox(height: 24),
              ConfirmPlaceOrderSummary(
                userCaloriesRequired: userRequiredCalories,
              ),
            ],
          ),
        );
      },
    );
  }
}
