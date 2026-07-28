import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/custom_home_profile_image.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/widgets/custom_notification_icon.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeAppBar extends StatefulWidget {
  const CustomHomeAppBar({super.key});

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        CustomHomeProfileImage(),
        const SizedBox(width: 11),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${LocaleKeys.home_goodMorning.tr()} !..",
              style: AppStyles.textStyle16Regular.copyWith(
                color: colorScheme.tertiaryContainer,
              ),
            ),
            const SizedBox(height: 2),
            BlocBuilder<GetUserDataCubit, GetUserDataState>(
              builder: (context, state) {
                if (state is SuccessGetUserDataState) {
                  return Text(
                    state.userEntity.name,
                    style: AppStyles.textStyle16Bold,
                  );
                }
                return Text(
                  LocaleKeys.homeStatus_loadingYourName.tr(),
                  style: AppStyles.textStyle16Bold,
                );
              },
            ),
          ],
        ),
        Spacer(),
        CustomNotificationIcon(),
      ],
    );
  }
}
