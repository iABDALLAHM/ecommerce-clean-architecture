import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 35,
          child: Image.network(imageUrl),
        ),
        Positioned(
          top: 59,
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
