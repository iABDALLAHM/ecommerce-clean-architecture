import 'package:ecommerce_clean_architecture/core/functions/get_specific_date.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
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
    return Container(
      padding: EdgeInsets.only(right: 9),
      color: Color(0xffF9F9F9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 6,
                backgroundColor: isDone
                    ? AppColors.primaryColor
                    : Color(0xffEBEBEB),
              ),
              stepIndex == 5
                  ? SizedBox(width: 2, height: 30)
                  : Container(
                      width: 2,
                      height: 30,
                      color: isDone
                          ? AppColors.lightPrimaryColor
                          : Color(0xffF4F5F9),
                    ),
            ],
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: AppStyles.textStyle13SemiBold.copyWith(
              color: isDone ? Colors.black : Color(0xff949D9E),
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date != null ? getSpecificDate(date: date!) : "قيد الإنتظار",
                style: AppStyles.textStyle13SemiBold.copyWith(
                  color: Color(0xff949D9E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
