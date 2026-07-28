import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.subTitle,
    this.price = 0,
    required this.onPressed,
  });

  final bool isSelected;
  final String title, subTitle;
  final int price;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(width: 1.2, color: colorScheme.primary)
            : null,
        borderRadius: BorderRadius.circular(4),
        color: colorScheme.tertiaryFixedDim,
      ),
      child: ListTile(
        trailing: price == 0
            ? Text(
                "مجاني",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: colorScheme.primaryFixed,
                ),
              )
            : Text(
                "$price جنيه",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: colorScheme.primaryFixed,
                ),
              ),
        title: Text(title, style: AppStyles.textStyle13SemiBold),
        subtitle: Text(
          subTitle,
          style: AppStyles.textStyle13Regular.copyWith(
            color: colorScheme.tertiaryContainer,
          ),
        ),
        leading: IconButton(
          onPressed: onPressed,
          icon: isSelected
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorScheme.surface,
                  ),
                  padding: EdgeInsets.all(3),
                  child: Icon(
                    Icons.circle,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                )
              : Icon(
                  Icons.circle_outlined,
                  color: colorScheme.tertiaryContainer,
                  size: 20,
                ),
        ),
      ),
    );
  }
}
