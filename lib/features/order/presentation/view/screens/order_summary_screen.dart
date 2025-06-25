import 'package:balanced_meal_app/core/utils/routes/route_name.dart';
import 'package:balanced_meal_app/features/order/presentation/view_model/order_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/order_cubit.dart';
import '../widgets/order_summary_body.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final double userRequiredCalories = args?['userRequiredCalories'];
    final OrderCubit orderCubit = args?['orderCubit'];

    return BlocProvider<OrderCubit>.value(
      value: orderCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.OrderSummary.tr()),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: BlocListener<OrderCubit, OrderState>(
          listener: (context, state) {
            if (state.placeOrderState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            }
            if (state.placeOrderState is BaseSuccessState) {
              AppDialogs.hideLoading(context);
              Navigator.of(
                context,
              ).popUntil(ModalRoute.withName(RouteName.welcomeRoute));
            }
            if (state.placeOrderState is BaseErrorState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(
                context,
                message: (state.placeOrderState as BaseErrorState).errorMessage,
              );
            }
          },
          child: OrderSummaryBody(userRequiredCalories: userRequiredCalories),
        ),
      ),
    );
  }
}
