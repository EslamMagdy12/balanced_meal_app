import 'package:balanced_meal_app/core/utils/di/di.dart';
import 'package:balanced_meal_app/core/utils/l10n/locale_keys.g.dart';
import 'package:balanced_meal_app/features/user_details/presentation/view/widgets/user_details_form.dart';
import 'package:balanced_meal_app/features/user_details/presentation/view_model/user_details_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/user_details_next_button.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key});

  final UserDetailsCubit userDetailsCubit = getIt<UserDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userDetailsCubit,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(LocaleKeys.EnterYourDetails.tr()),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: userDetailsCubit.formKey,
                    child: const UserDetailsForm(),
                  ),
                ),
              ),
              const UserDetailsNextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
