import 'package:flutter/material.dart';

class CustomOtpBox extends StatelessWidget {
  const CustomOtpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xffE6E9EA)),
        color: Color(0xffF9FAFA),
      ),
      child: Center(child: Text("3")),
    );
  }
}
