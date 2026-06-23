import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomArrowWidget extends StatelessWidget {
  const CustomArrowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Color(0xffF1F1F5),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 21,
          child: Icon(Icons.arrow_back_ios_new, size: 18),
        ),
      ),
    );
  }
}
