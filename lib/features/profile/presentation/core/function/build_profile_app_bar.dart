import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildProfileAppBar(
  BuildContext context, {
  required String title,
  bool isMain = false,
}) {
  var colorScheme = Theme.of(context).colorScheme;
  var appBarTheme = Theme.of(context).appBarTheme;

  return AppBar(
    title: Text(title),
    centerTitle: true,

    leading: CircleAvatar(
      backgroundColor: appBarTheme.backgroundColor,
      radius: 21,
      child: GestureDetector(
        onTap: () {
          if (!isMain) {
            context.pop();
          }
        },
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: colorScheme.onSurface,
        ),
      ),
    ),
  );
}
