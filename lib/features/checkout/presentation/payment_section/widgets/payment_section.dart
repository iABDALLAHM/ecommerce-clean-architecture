import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_card_number_text_field.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_card_text_field_holder_name.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_cvv_card_number_text_field.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_expire_date_text_field.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/payment_section/cubits/payment_validation_cubit/payment_validation_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/payment_section/cubits/payment_validation_cubit/payment_validation_state.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/payment_section/widgets/choose_payment_card_option.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/payment_section/widgets/make_card_as_default.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  late TextEditingController cardHolderNameController;
  late TextEditingController cardNumberController;
  late TextEditingController cardExpiredDateController;
  late TextEditingController cardCVVController;

  @override
  void initState() {
    _initializeControllers();
    super.initState();
  }

  void _initializeControllers() async {
    var cardEntity = context.read<CheckOutCubit>().orderEntity.cardEntity;

    cardHolderNameController = TextEditingController(
      text: cardEntity.cardHolderName,
    );
    cardNumberController = TextEditingController(text: cardEntity.cardNumber);
    cardExpiredDateController = TextEditingController(
      text: cardEntity.cardExpiredDate,
    );
    cardCVVController = TextEditingController(text: cardEntity.cardCvv);
    cardEntity.cardImageType = kMasterCardIcon;
  }

  @override
  Widget build(BuildContext context) {
    var cardEntity = context.read<CheckOutCubit>().orderEntity.cardEntity;
    var checkOutCubit = context.read<CheckOutCubit>();
    var paymentValidationCubit = context.watch<PaymentValidationCubit>();

    return BlocListener<PaymentValidationCubit, PaymentValidationState>(
      listener: (context, state) {
        if (state is PaymentValidationFailureState) {
          showSnackBar(context, message: "من فضلك اكمل بيانات الدفع");
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: paymentValidationCubit.formKey,
          autovalidateMode: paymentValidationCubit.autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                Text(LocaleKeys.checkOut_paymentOptionMainText.tr(),
                  style: AppStyles.textStyle13Bold,
                ),
                const SizedBox(height: 13),
                Row(
                  children: [
                    ChoosePaymentCardOption(image: Assets.imagesApplePay),
                    const SizedBox(width: 16),
                    ChoosePaymentCardOption(image: Assets.imagesPayPal),
                    const SizedBox(width: 16),

                    ChoosePaymentCardOption(image: Assets.imagesMasterCard),
                    const SizedBox(width: 16),

                    ChoosePaymentCardOption(image: Assets.imagesVisa),
                  ],
                ),

                const SizedBox(height: 16),

                CustomCardHolderNameTextField(
                  controller: cardHolderNameController,
                  onSaved: (value) {
                    cardEntity.cardHolderName = value;
                  },
                ),

                const SizedBox(height: 8),

                CustomCardNumberTextField(
                  controller: cardNumberController,
                  onSaved: (value) {
                    cardEntity.cardNumber = value;
                  },
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      child: CustomExpireDateTextField(
                        controller: cardExpiredDateController,
                        onSaved: (value) {
                          cardEntity.cardExpiredDate = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomCVVCardNumberTextField(
                        controller: cardCVVController,
                        onSaved: (value) {
                          cardEntity.cardCvv = value;
                          checkOutCubit.updatePaymentCardDetails(
                            cardEntity: cardEntity,
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                MakeCardAsDefault(
                  isSelected: (value) {
                    cardEntity.markAsDefault = value;
                    checkOutCubit.updatePaymentCardDetails(
                      cardEntity: cardEntity,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
