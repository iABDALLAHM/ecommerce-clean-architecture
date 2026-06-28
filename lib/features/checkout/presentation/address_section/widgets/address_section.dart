import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/address_section/widgets/save_location_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({super.key});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  @override
  Widget build(BuildContext context) {
    var shippingAddressEntity = context
        .read<OrderEntity>()
        .shippingAddressEntity;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: "الاسم كامل",
              onSaved: (value) {
                shippingAddressEntity.name = value;
              },
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "البريد الإلكتروني",
              onSaved: (value) {
                shippingAddressEntity.email = value;
              },
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "العنوان",
              onSaved: (value) {
                shippingAddressEntity.address = value;
              },
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "المدينه",
              onSaved: (value) {
                shippingAddressEntity.city = value;
              },
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "رقم الطابق , رقم الشقه ..",
              textInputType: TextInputType.number,
              onSaved: (value) {
                shippingAddressEntity.addressDetails = value;
              },
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "رقم الهاتف",
              onSaved: (value) {
                shippingAddressEntity.phone = value;
              },
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            SaveLocationSection(isSaveLocation: (bool value) {}),
          ],
        ),
      ),
    );
  }
}
