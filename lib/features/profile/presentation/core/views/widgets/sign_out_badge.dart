import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/sign_out_dialog_widget.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutBadge extends StatelessWidget {
  const SignOutBadge({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: colorScheme.primaryContainer,
      child: Row(
        children: [
          Spacer(flex: 2),
          Text(
            LocaleKeys.profile_signOutSection.tr(),
            style: AppStyles.textStyle13SemiBold.copyWith(
              color: colorScheme.primary,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              final signOutCubit = context.read<SignOutCubit>();
              showDialog(
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                    value: signOutCubit,
                    child: SignOutDialogWidget(),
                  );
                },
              );
            },
            child: RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.logout, color: colorScheme.primaryFixed),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
