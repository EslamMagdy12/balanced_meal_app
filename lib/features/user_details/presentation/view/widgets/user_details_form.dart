import 'package:balanced_meal_app/features/user_details/presentation/view_model/user_details_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/user_details_state.dart';

class UserDetailsForm extends StatelessWidget {
  const UserDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDetailsCubit userDetailsCubit = context.read<UserDetailsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.Gender.tr(),
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: AppColors.grayShade),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField(
          dropdownColor: AppColors.white,
          hint: Text(LocaleKeys.ChooseYourGender.tr()),
          value: userDetailsCubit.selectedGender,
          items: [LocaleKeys.Male.tr(), LocaleKeys.Female.tr()]
              .map(
                (option) =>
                    DropdownMenuItem(value: option, child: Text(option)),
              )
              .toList(),
          onChanged: (value) {
            userDetailsCubit.selectedGender = value;
            userDetailsCubit.doIntent(ValidateColorButtonAction());
          },
          validator: userDetailsCubit.validator.validateGender,
        ),
        const SizedBox(height: 24),
        Text(
          LocaleKeys.Weight.tr(),
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: AppColors.grayShade),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: (value) {
            userDetailsCubit.doIntent(ValidateColorButtonAction());
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: userDetailsCubit.validator.validateWeight,
          controller: userDetailsCubit.weightController,
          decoration: InputDecoration(
            hintText: LocaleKeys.EnterYourWeight.tr(),
            suffixText: LocaleKeys.Kg.tr(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24),
        Text(
          LocaleKeys.Height.tr(),
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: AppColors.grayShade),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: (value) {
            userDetailsCubit.doIntent(ValidateColorButtonAction());
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: userDetailsCubit.validator.validateHeight,
          controller: userDetailsCubit.heightController,
          decoration: InputDecoration(
            hintText: LocaleKeys.EnterYourHeight.tr(),
            suffixText: LocaleKeys.Cm.tr(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24),
        Text(
          LocaleKeys.Age.tr(),
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: AppColors.grayShade),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: (value) {
            userDetailsCubit.doIntent(ValidateColorButtonAction());
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: userDetailsCubit.ageController,
          validator: userDetailsCubit.validator.validateAge,
          decoration: InputDecoration(hintText: LocaleKeys.EnterYourAge.tr()),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
