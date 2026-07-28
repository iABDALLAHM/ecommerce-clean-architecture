import 'package:ecommerce_clean_architecture/core/functions/get_specific_date.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrderStatusItem extends StatelessWidget {
  final String title;
  final DateTime? date;
  final bool isDone;
  final int stepIndex;

  const OrderStatusItem({
    super.key,
    required this.title,
    required this.date,
    required this.isDone,
    required this.stepIndex,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsetsDirectional.only(start: 9, end: 9),
      color: colorScheme.tertiaryFixedDim,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 6,
                backgroundColor: isDone
                    ? colorScheme.primary
                    : colorScheme.tertiaryFixed,
              ),
              stepIndex == 5
                  ? SizedBox(width: 2, height: 30)
                  : Container(
                      width: 2,
                      height: 30,
                      color: isDone
                          ? colorScheme.primaryFixed
                          : colorScheme.tertiaryFixed,
                    ),
            ],
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: AppStyles.textStyle13SemiBold.copyWith(
              color: isDone
                  ? colorScheme.onSurface
                  : colorScheme.tertiaryContainer,
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date != null ? getSpecificDate(date: date!) : "قيد الإنتظار",
                style: AppStyles.textStyle13SemiBold.copyWith(
                  color: colorScheme.tertiaryContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
