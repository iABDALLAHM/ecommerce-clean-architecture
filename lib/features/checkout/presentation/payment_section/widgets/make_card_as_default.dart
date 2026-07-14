import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MakeCardAsDefault extends StatefulWidget {
  const MakeCardAsDefault({super.key, required this.isSelected});
  final ValueChanged<bool> isSelected;
  @override
  State<MakeCardAsDefault> createState() => _MakeCardAsDefaultState();
}

class _MakeCardAsDefaultState extends State<MakeCardAsDefault> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
            widget.isSelected(isSelected);
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: Colors.transparent)
                  : Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
              color: isSelected ? AppColors.primaryColor : Colors.white,
            ),
            child: isSelected
                ? Icon(Icons.check, size: 20, color: Colors.white)
                : Icon(null, size: 20, color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
        Text("جعل البطاقة افتراضية"),
      ],
    );
  }
}
