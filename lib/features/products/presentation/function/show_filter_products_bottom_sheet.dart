import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/widgets/radio_choices.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> showFilterProductsBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    builder: (context) => Container(
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Center(
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 26),
              Text("ترتيب حسب :", style: AppStyles.textStyle19Bold),
              const SizedBox(height: 11),
              RadioChoices(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomButton(
                  text: "تصفيه",
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              const SizedBox(height: 52),
            ],
          ),
        ),
      ),
    ),
  );
}
