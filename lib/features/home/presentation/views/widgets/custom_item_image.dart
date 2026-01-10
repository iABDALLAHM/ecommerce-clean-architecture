import 'package:flutter/material.dart';

class CustomItemImage extends StatelessWidget {
  const CustomItemImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 26, horizontal: 10),
      decoration: BoxDecoration(color: Color(0xffF3F5F7)),
      child: Center(child: Image.network(imageUrl, width: 53, height: 40)),
    );
  }
}
