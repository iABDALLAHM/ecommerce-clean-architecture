import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body_edit_image_bottom_sheet.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInformationSection extends StatefulWidget {
  const ProfileInformationSection({super.key});

  @override
  State<ProfileInformationSection> createState() =>
      _ProfileInformationSectionState();
}

class _ProfileInformationSectionState extends State<ProfileInformationSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            var updateImageCubit = context.read<UpdateUserImageCubit>();
            var getImageCubit = context.read<GetImageCubit>();
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: updateImageCubit),
                  BlocProvider.value(value: getImageCubit),
                ],
                child: ProfileBodyEditImageBottomSheet(),
              ),
            );
          },
          child: ProfileBodyImage(),
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(getUserData().name, style: AppStyles.textStyle13Bold),
            const SizedBox(height: 2),
            Text(
              getUserData().email,
              style: AppStyles.textStyle13Bold.copyWith(
                color: Color(0xff888FA0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
