import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:balanced_meal_app/features/order/presentation/view_model/order_cubit.dart';
import 'package:balanced_meal_app/features/order/presentation/view_model/order_state.dart';
import 'package:balanced_meal_app/core/utils/di/di.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../widgets/order_body.dart';

class OrderScreen extends StatelessWidget {
  final OrderCubit orderCubit = getIt<OrderCubit>();

  OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userRequiredCalories =
        ModalRoute.of(context)?.settings.arguments as double?;
    return BlocProvider<OrderCubit>(
      create: (_) => orderCubit
        ..doIntent(GetVegetablesAction())
        ..doIntent(GetCarbsAction())
        ..doIntent(GetMeatsAction()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.CreateYourOrder.tr()),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: OrderBody(userRequiredCalories: userRequiredCalories!),
      ),
    );
  }
}
