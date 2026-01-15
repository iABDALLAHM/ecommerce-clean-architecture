import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/fruit_item_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FruitItemDetailsHeader extends StatelessWidget {
  const FruitItemDetailsHeader({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned.fill(
          child: SizedBox(
            child: SvgPicture.asset(
              Assets.imagesItemDetailsbackground,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: height * .1,
          left: 0,
          right: 0,
          child: SizedBox(
            height: height * .2,
            width: width * .4,
            child: Image.network(imageUrl),
          ),
        ),
        Positioned(top: 40, right: 20, child: FruitItemDetailsAppBar()),
      ],
    );
  }
}
