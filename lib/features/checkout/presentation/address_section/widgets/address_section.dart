import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/address_section/cubits/address_validation_cubit/address_validation_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/address_section/cubits/address_validation_cubit/address_validation_state.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/address_section/widgets/save_location_section.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({super.key});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController addressDetailsController;
  late TextEditingController phoneNumController;

  @override
  void initState() {
    _initializeControllers();
    super.initState();
  }

  void _initializeControllers() {
    var shippingAddressEntity = context
        .read<CheckOutCubit>()
        .orderEntity
        .shippingAddressEntity;

    nameController = TextEditingController(text: shippingAddressEntity.name);
    emailController = TextEditingController(text: shippingAddressEntity.email);
    addressController = TextEditingController(
      text: shippingAddressEntity.address,
    );
    cityController = TextEditingController(text: shippingAddressEntity.city);
    addressDetailsController = TextEditingController(
      text: shippingAddressEntity.addressDetails,
    );
    phoneNumController = TextEditingController(
      text: shippingAddressEntity.phone,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    addressDetailsController.dispose();
    phoneNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var addressValidationCubit = context.read<AddressValidationCubit>();

    var checkOutCubit = context.read<CheckOutCubit>();

    var shippingAddressEntity = context
        .read<CheckOutCubit>()
        .orderEntity
        .shippingAddressEntity;

    return BlocListener<AddressValidationCubit, AddressValidationState>(
      listener: (context, state) {
        if (state is AddressValidationFailureState) {
          showSnackBar(context, message: "من فضلك اكمل تفاصيل التوصيل");
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Form(
            autovalidateMode: addressValidationCubit.autoValidateMode,
            key: addressValidationCubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                  controller: nameController,
                  hintText: "الاسم كامل",
                  onSaved: (value) {
                    shippingAddressEntity.name = value;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: emailController,
                  hintText: "البريد الإلكتروني",
                  onSaved: (value) {
                    shippingAddressEntity.email = value;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: addressController,
                  hintText: "العنوان",
                  onSaved: (value) {
                    shippingAddressEntity.address = value;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: cityController,
                  hintText: "المدينه",
                  onSaved: (value) {
                    shippingAddressEntity.city = value;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: addressDetailsController,
                  hintText: "رقم الطابق , رقم الشقه ..",
                  textInputType: TextInputType.number,
                  onSaved: (value) {
                    shippingAddressEntity.addressDetails = value;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: phoneNumController,
                  hintText: "رقم الهاتف",
                  onSaved: (value) {
                    shippingAddressEntity.phone = value;
                    checkOutCubit.updateShippingAddress(
                      address: shippingAddressEntity,
                    );
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 8),
                SaveLocationSection(isSaveLocation: (bool value) {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
