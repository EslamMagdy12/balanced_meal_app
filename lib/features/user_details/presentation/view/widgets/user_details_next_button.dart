import 'package:balanced_meal_app/core/assets/app_colors.dart';
import 'package:balanced_meal_app/core/utils/routes/route_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/user_details_cubit.dart';
import '../../view_model/user_details_state.dart';

class UserDetailsNextButton extends StatelessWidget {
  const UserDetailsNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDetailsCubit userDetailsCubit = context.read<UserDetailsCubit>();
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: userDetailsCubit.validate
              ? () {
                  userDetailsCubit.doIntent(CalculateCaloriesAction());
                  print("Calories: ${userDetailsCubit.calories}");
                  Navigator.of(context).pushNamed(
                    RouteName.homeRoute,
                    arguments: userDetailsCubit.calories,
                  );
                }
              : null,
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: WidgetStateProperty.all(
              userDetailsCubit.validate
                  ? AppColors.orange
                  : AppColors.lightBlue,
            ),
          ),
          child: Text(LocaleKeys.Next.tr()),
        );
      },
    );
  }
}
