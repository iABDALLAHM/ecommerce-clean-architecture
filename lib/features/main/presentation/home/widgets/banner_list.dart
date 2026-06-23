import 'package:ecommerce_clean_architecture/features/main/presentation/home/widgets/banner_item.dart';
import 'package:flutter/material.dart';

class BannerList extends StatelessWidget {
  const BannerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(3, (item) => BannerItem())),
    );
  }
}
