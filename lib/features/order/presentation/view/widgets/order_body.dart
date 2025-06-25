import 'package:balanced_meal_app/core/utils/l10n/locale_keys.g.dart';
import 'package:balanced_meal_app/features/order/presentation/view/widgets/order_summary.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/routes/route_name.dart';
import '../../view_model/order_cubit.dart';
import '../../view_model/order_state.dart';
import 'order_section_list.dart';

class OrderBody extends StatelessWidget {
  final double userRequiredCalories;

  const OrderBody({super.key, required this.userRequiredCalories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.Vegetables.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<OrderCubit, OrderState>(
            buildWhen: (p, c) => p.vegetablesState != c.vegetablesState,
            builder: (context, state) {
              return OrderSectionList(orderState: state.vegetablesState);
            },
          ),
          const SizedBox(height: 24),
          Text(
            LocaleKeys.Meats.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<OrderCubit, OrderState>(
            buildWhen: (p, c) => p.meatsState != c.meatsState,
            builder: (context, state) {
              return OrderSectionList(orderState: state.meatsState);
            },
          ),
          const SizedBox(height: 24),
          Text(
            LocaleKeys.Carbs.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<OrderCubit, OrderState>(
            buildWhen: (p, c) => p.carbsState != c.carbsState,
            builder: (context, state) {
              return OrderSectionList(orderState: state.carbsState);
            },
          ),
          const SizedBox(height: 24),
          OrderSummary(
            userCaloriesRequired: userRequiredCalories,
            buttonLabel: LocaleKeys.PlaceOrder.tr(),
            onConfirmed: () {
              Navigator.of(context).pushNamed(
                RouteName.orderSummaryRoute,
                arguments: {
                  'userRequiredCalories': userRequiredCalories,
                  'orderCubit': context.read<OrderCubit>(),
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
