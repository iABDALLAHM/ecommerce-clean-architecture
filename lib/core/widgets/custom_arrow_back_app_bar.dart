import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomArrowBackAppBar extends StatelessWidget {
  const CustomArrowBackAppBar({super.key, this.isBack = true});
  final bool isBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isBack) {
          context.pop();
        }
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Color(0xffF1F1F5),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 27,
          child: Icon(
            IconData(
              Icons.arrow_back_ios_new.codePoint,
              fontFamily: Icons.arrow_back_ios_new.fontFamily,
              fontPackage: Icons.arrow_back_ios_new.fontPackage,
              matchTextDirection: true,
            ),
            size: 18,
          ),
        ),
      ),
    );
  }
}
