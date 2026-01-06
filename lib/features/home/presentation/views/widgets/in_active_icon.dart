import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveIcon extends StatelessWidget {
  const InActiveIcon({super.key, required this.inActiveIcon});
  final String inActiveIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: SvgPicture.asset(inActiveIcon),
    );
  }
}
