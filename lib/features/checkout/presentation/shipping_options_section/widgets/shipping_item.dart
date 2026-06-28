import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.onPressed,
  });
  final bool isSelected;
  final String title, subTitle;
  final int? price;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(width: 1.2, color: AppColors.primaryColor)
            : null,
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromARGB(56, 158, 158, 158),
      ),
      child: ListTile(
        trailing: price == null || price == 0
            ? Text(
                "مجاني",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              )
            : Text(
                "$price جنيه",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
        title: Text(title, style: AppStyles.textStyle13SemiBold),
        subtitle: Text(
          subTitle,
          style: AppStyles.textStyle13Regular.copyWith(
            color: const Color.fromARGB(99, 0, 0, 0),
          ),
        ),
        leading: IconButton(
          onPressed: onPressed,
          icon: isSelected
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(3),
                  child: Icon(
                    Icons.circle,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                )
              : Icon(Icons.circle_outlined, color: Color(0xff949D9E), size: 20),
        ),
      ),
    );
  }
}
