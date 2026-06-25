import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/main/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("${AppRoutes.home}${AppRoutes.notifications}");
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(9),
            decoration: ShapeDecoration(
              color: Color(0xffEEF8ED),
              shape: OvalBorder(),
            ),
            child: Icon(
              Icons.notifications_outlined,
              color: AppColors.primaryColor,
            ),
          ),
          BlocBuilder<GetNotificationsCubit, GetNotificationsStates>(
            builder: (context, state) {
              if (state is SuccessGetNotificationsState) {
                return Positioned(
                  top: 5,
                  right: 16,
                  child: Icon(Icons.circle, size: 10, color: Colors.red),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
