import 'package:balanced_meal_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class UserDetailsState extends Equatable {
  final BaseState userDetailsState;
  final bool isValidate;

  const UserDetailsState({
    required this.userDetailsState,
    this.isValidate = false,
  });

  UserDetailsState copyWith({BaseState? userDetailsState, bool? isValidate}) {
    return UserDetailsState(
      userDetailsState: userDetailsState ?? this.userDetailsState,
      isValidate: isValidate ?? this.isValidate,
    );
  }

  @override
  List<Object?> get props => [userDetailsState, isValidate];
}

sealed class UserDetailsActions {}

class CalculateCaloriesAction extends UserDetailsActions {}

class ValidateColorButtonAction extends UserDetailsActions {}
