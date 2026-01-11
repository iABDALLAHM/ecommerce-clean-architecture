import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: ValueListenableBuilder<AutovalidateMode>(
          valueListenable: widget.valueListenable,
          builder: (context, value, child) => Form(
            key: widget.formKey,
            autovalidateMode: value,
            child: Column(
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: "الاسم كامل",
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.name =
                        value;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: "البريد الإلكتروني",
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.email =
                        value;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: "العنوان",
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.address =
                        value;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: "المدينه",
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.city =
                        value;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: "رقم الطابق , رقم الشقه ..",
                  textInputType: TextInputType.number,
                  onSaved: (value) {
                    context
                            .read<OrderEntity>()
                            .shippingAddressEntity
                            .addressDetails =
                        value;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: "رقم الهاتف",
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.phone =
                        value;
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
