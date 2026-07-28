import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/features/main/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        context.go("${AppRoutes.home}${AppRoutes.notifications}");
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(9),
            decoration: ShapeDecoration(
              color: colorScheme.primaryContainer,
              shape: OvalBorder(),
            ),
            child: Icon(
              Icons.notifications_outlined,
              color: colorScheme.primary,
            ),
          ),
          BlocBuilder<GetNotificationsCubit, GetNotificationsStates>(
            builder: (context, state) {
              if (state is SuccessGetNotificationsState) {
                return Positioned(
                  top: 5,
                  right: 16,
                  child: Icon(Icons.circle, size: 10, color: colorScheme.error),
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
