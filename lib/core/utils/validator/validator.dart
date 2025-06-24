import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../l10n/locale_keys.g.dart';

@injectable
class Validator {
  String? validateGender(String? input) {
    if (input == null || input.isEmpty) {
      return LocaleKeys.GenderCannotBeEmpty.tr();
    }
    return null;
  }

  String? validateWeight(String? input) {
    if (input == null || input.isEmpty) {
      return LocaleKeys.WeightCannotBeEmpty.tr();
    }
    final weight = double.tryParse(input);
    if (weight == null || weight <= 0) {
      return LocaleKeys.InvalidWeight.tr();
    }
    return null;
  }

  String? validateHeight(String? input) {
    if (input == null || input.isEmpty) {
      return LocaleKeys.HeightCannotBeEmpty.tr();
    }
    final height = double.tryParse(input);
    if (height == null || height <= 0) {
      return LocaleKeys.InvalidHeight.tr();
    }
    return null;
  }

  String? validateAge(String? input) {
    if (input == null || input.isEmpty) {
      return LocaleKeys.AgeCannotBeEmpty.tr();
    }
    final age = int.tryParse(input);
    if (age == null || age <= 0) {
      return LocaleKeys.InvalidAge.tr();
    }
    return null;
  }
}
