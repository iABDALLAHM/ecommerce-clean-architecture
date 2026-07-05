import 'package:ecommerce_clean_architecture/core/functions/get_specific_date.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrackOrderStatusItem extends StatelessWidget {
  const TrackOrderStatusItem({
    super.key,
    required this.stepNum,
    required this.stepTitle,
    required this.stepImageOn,
    required this.stepStatus,
    required this.stepDate,
    required this.stepImageOff,
  });
  final int stepNum;
  final String stepTitle;
  final String stepImageOn;
  final String stepImageOff;
  final bool stepStatus;
  final DateTime? stepDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: stepStatus == true
                  ? SvgPicture.asset(stepImageOn)
                  : SvgPicture.asset(stepImageOff),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(stepTitle, style: AppStyles.textStyle13Bold),
                stepStatus == false
                    ? Text(
                        "قيد الإنتظار",
                        style: AppStyles.textStyle13SemiBold.copyWith(
                          color: Color(0xff949D9E),
                        ),
                      )
                    : Text(
                        stepDate != null
                            ? getSpecificDate(date: stepDate!)
                            : "قيد الإنتظار",
                        style: AppStyles.textStyle13SemiBold.copyWith(
                          color: Color(0xff949D9E),
                        ),
                      ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 30),
            stepNum == 5
                ? SizedBox()
                : Container(width: 2, height: 30, color: Colors.grey.shade300),
            stepNum == 5
                ? SizedBox()
                : Expanded(
                    child: Divider(
                      endIndent: 30,
                      indent: 30,
                      color: Colors.grey.shade300,
                    ),
                  ),
          ],
        ),
      ],
    );
  }


}
