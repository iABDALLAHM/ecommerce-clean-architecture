import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/item_details/presentation/views/widgets/fruit_item_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FruitItemDetailsHeader extends StatelessWidget {
  const FruitItemDetailsHeader({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            Assets.imagesItemDetailsbackground,
            fit: BoxFit.fill,
            matchTextDirection: true,
          ),
        ),
        Positioned(
          top: height * .1,
          left: 0,
          right: 0,
          bottom: 0,
          child: SizedBox(
            child: Image.network(imageUrl, alignment: Alignment.center),
          ),
        ),
        const PositionedDirectional(
          top: 40,
          start: 20,
          child: FruitItemDetailsAppBar(),
        ),
      ],
    );
  }
}
