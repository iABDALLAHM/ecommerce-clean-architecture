import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(hintText: "الاسم كامل", onSaved: (value) {}),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "البريد الإلكتروني",
              onSaved: (value) {},
            ),
            const SizedBox(height: 8),
            CustomTextFormField(hintText: "العنوان", onSaved: (value) {}),
            const SizedBox(height: 8),
            CustomTextFormField(hintText: "المدينه", onSaved: (value) {}),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "رقم الطابق , رقم الشقه ..",
              textInputType: TextInputType.number,
              onSaved: (value) {},
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "رقم الهاتف",
              onSaved: (value) {},
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
