

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.itemImage,
    required this.itemPrice,
    required this.itemName,
    required this.date,
  });

  final String itemImage, itemPrice, itemName;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    var languageCode = context.locale.languageCode;
    return Container(
      padding: EdgeInsets.all(15),
      decoration: ShapeDecoration(
        color: Color(0xffF8FAFC),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Color(0xffF1F5F9)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: ShapeDecoration(
              color: Color(0xffF1F5F9),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xffE2E8F0)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Image.network(itemImage, width: 30),
          ),
          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                maxLines: 1,
                style: AppStyles.textStyle13Bold.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "$itemPrice ${languageCode == arabicLanguageCode ? "ج.م" : "EGP"}",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: Color(0xff16A34A),
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
