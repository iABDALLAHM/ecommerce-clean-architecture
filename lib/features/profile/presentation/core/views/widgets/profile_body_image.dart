import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBodyImage extends StatefulWidget {
  const ProfileBodyImage({super.key});

  @override
  State<ProfileBodyImage> createState() => _ProfileBodyImageState();
}

class _ProfileBodyImageState extends State<ProfileBodyImage> {
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        BlocBuilder<GetUserDataCubit, GetUserDataState>(
          builder: (context, state) {
            if (state is SuccessGetUserDataState) {
              return CircleAvatar(
                backgroundColor: scaffoldBackgroundColor,
                radius: 35,
                child: Image.network(
                  state.userEntity.userImage,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.person);
                  },
                ),
              );
            }
            return CircleAvatar(
              backgroundColor: scaffoldBackgroundColor,
              radius: 35,
              child: Icon(Icons.person),
            );
          },
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: scaffoldBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Assets.imagesCameraIcon),
            ),
          ),
        ),
      ],
    );
  }
}
