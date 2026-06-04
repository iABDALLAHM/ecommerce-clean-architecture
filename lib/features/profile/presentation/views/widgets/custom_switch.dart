import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/manager/switch_button_cubit/switch_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    bool isActive = context.watch<SwitchButtonCubit>().state.currentState;
    return SizedBox(
      height: 20,
      child: Switch(
        thumbColor: WidgetStateProperty.all(Colors.white),
        padding: EdgeInsets.zero,
        activeThumbColor: Colors.white,
        activeTrackColor: AppColors.primaryColor,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Color(0xff888FA0),
        value: isActive,
        onChanged: (change) {
          context.read<SwitchButtonCubit>().changeState(!isActive);
        },
      ),
    );
  }
}
