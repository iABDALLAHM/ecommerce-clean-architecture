import 'package:flutter/material.dart';

class CustomCircularProgressWidget extends StatelessWidget {
  const CustomCircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Center(child: CircularProgressIndicator(color: colorScheme.primary));
  }
}
