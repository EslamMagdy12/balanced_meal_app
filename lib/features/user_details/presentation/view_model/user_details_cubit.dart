import 'package:balanced_meal_app/core/utils/validator/validator.dart';
import 'package:balanced_meal_app/features/user_details/presentation/view_model/user_details_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';

@injectable
class UserDetailsCubit extends Cubit<UserDetailsState> {
  final Validator validator;

  UserDetailsCubit(this.validator)
    : super(UserDetailsState(userDetailsState: BaseInitialState()));
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedGender;
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  bool validate = false;
  double? calories;

  void doIntent(UserDetailsActions action) {
    switch (action) {
      case CalculateCaloriesAction():
        _calculateCalories();
      case ValidateColorButtonAction():
        _validateColorButton();
    }
  }

  void _calculateCalories() {
    final weight = double.tryParse(weightController.text);
    final height = double.tryParse(heightController.text);
    final age = double.tryParse(ageController.text);
    if (selectedGender == LocaleKeys.Male.tr()) {
      calories = 666.47 + 13.75 * weight! + 5 * height! - 6.75 * age!;
    } else {
      calories = 655.1 + 9.56 * weight! + 1.85 * height! - 4.67 * age!;
    }
  }

  void _validateColorButton() {
    if (selectedGender == null ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty ||
        ageController.text.isEmpty) {
      validate = false;
    } else if (!formKey.currentState!.validate()) {
      validate = false;
    } else {
      validate = true;
    }
    emit(
      state.copyWith(
        userDetailsState: BaseInitialState(),
        isValidate: validate,
      ),
    );
  }
}
