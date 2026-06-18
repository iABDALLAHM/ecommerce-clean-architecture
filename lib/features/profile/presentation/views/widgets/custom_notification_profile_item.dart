import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/core/widgets/custom_divider.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/cubits/switch_button_cubit/switch_button_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/views/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomSwitchProfileItem extends StatelessWidget {
  const CustomSwitchProfileItem({
    super.key,
    required this.icon,
    required this.name,
    required this.onPressed,
  });
  final String icon, name;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchButtonCubit(),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 7),
              Text(
                name,
                style: AppStyles.textStyle13SemiBold.copyWith(
                  color: Color(0xff949D9E),
                ),
              ),
              Spacer(),
              CustomSwitch(),
            ],
          ),
          const SizedBox(height: 8),
          CustomDivider(),
        ],
      ),
    );
  }
}
