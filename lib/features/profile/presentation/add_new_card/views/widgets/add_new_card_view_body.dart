import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_card_number_text_field.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_card_text_field_holder_name.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_cvv_card_number_text_field.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_expire_date_text_field.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/card_entity/card_entity.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/cubits/add_new_card_cubit/add_new_card_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/views/widgets/add_new_card_bloc_listener.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/views/widgets/custom_my_cards_button.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/views/widgets/add_new_card_text_field.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/views/widgets/make_card_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCardViewBody extends StatefulWidget {
  const AddNewCardViewBody({super.key});

  @override
  State<AddNewCardViewBody> createState() => _AddNewCardViewBodyState();
}

class _AddNewCardViewBodyState extends State<AddNewCardViewBody> {
  String cardHolderName = "";
  String cardNumber = "";
  String cardCVV = "";
  String cardImageType = "";
  String cardExpiredDate = "";
  bool markAsDefault = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return AddNewCardBlocListener(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                const SizedBox(height: 24),
                CustomCardHolderNameTextField(
                  onSaved: (value) {
                    if (value != null) {
                      cardHolderName = value;
                    }
                  },
                ),
                const SizedBox(height: 8),
                CustomCardNumberTextField(
                  onSaved: (value) {
                    if (value != null) {
                      cardNumber = value;
                    }
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CustomExpireDateTextField(
                        onSaved: (value) {
                          if (value != null) {
                            cardExpiredDate = value;
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomCVVCardNumberTextField(
                        onSaved: (value) {
                          if (value != null) {
                            cardCVV = value;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                MakeCardAsDefault(
                  onChange: (value) {
                    markAsDefault = value;
                  },
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.39),
                SizedBox(
                  height: 54,
                  width: double.infinity,
                  child: CustomWalletButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        final newCard = CardEntity(
                          cardHolderName: cardHolderName,
                          cardNumber: cardNumber,
                          cardCvv: cardCVV,
                          cardExpiredDate: cardExpiredDate,
                          markAsDefault: markAsDefault,
                          cardImageType: cardImageType,
                          cardHolderId: getIt.get<SharedPrefService>().getData(
                            key: "user-id",
                          ),
                        );
                        context.read<AddNewCardCubit>().addCard(
                          cardEntity: newCard,
                        );
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: "أضف وسيلة دفع جديده",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
