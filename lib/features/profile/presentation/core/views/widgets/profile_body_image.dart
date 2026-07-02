import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBodyImage extends StatelessWidget {
  const ProfileBodyImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BlocBuilder<GetUserDataCubit, GetUserDataState>(
          builder: (context, state) {
            if (state is SuccessGetUserDataState) {
              return CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35,
                backgroundImage: NetworkImage(state.userEntity.userImage),
              );
            }
            return CircleAvatar(
              backgroundColor: Colors.white,
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
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
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
