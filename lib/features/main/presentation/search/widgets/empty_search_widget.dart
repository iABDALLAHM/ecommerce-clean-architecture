import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 90, right: 20, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(20, 0, 0, 0),
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Text(
              "لا توجد نتائج بحث",
              style: AppStyles.textStyle13Regular.copyWith(
                color: Color(0xff949D9E),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 22),
            child: SvgPicture.asset(Assets.imagesSearchillstrationIcon),
          ),
          const SizedBox(height: 43),
          Text(
            "البحث",
            style: AppStyles.textStyle16Bold.copyWith(color: Color(0xff616A6B)),
          ),
          Text(
            "عفوًا... هذه المعلومات غير متوفرة للحظة",
            style: AppStyles.textStyle13Regular.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
        ],
      ),
    );
  }
}
