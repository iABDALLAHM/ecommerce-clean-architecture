import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_email_cubit/update_user_email_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/cubits/update_user_email_cubit/update_user_email_state.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/change_your_email_bloc_listener.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeYourEmailBottomSheet extends StatefulWidget {
  const ChangeYourEmailBottomSheet({super.key});

  @override
  State<ChangeYourEmailBottomSheet> createState() =>
      _ChangeYourEmailBottomSheetState();
}

class _ChangeYourEmailBottomSheetState
    extends State<ChangeYourEmailBottomSheet> {
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String newEmail = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ChangeYourEmailBlocListener(
        child: BlocBuilder<UpdateUserEmailCubit, UpdateUserEmailState>(
          builder: (context, state) {
            return CustomProgressWidget(
              state: state is LoadingUpdateUserEmailState,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  autovalidateMode: autovalidateMode,
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          LocaleKeys.profileStatus_changeYorEmail.tr(),
                          style: AppStyles.textStyle16SemiBold,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          hintText: LocaleKeys.profileStatus_writeNewEmail.tr(),
                          onSaved: (value) {
                            newEmail = value ?? "";
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          hintText: LocaleKeys.profileStatus_writeYourPassword
                              .tr(),
                          onSaved: (value) {
                            password = value ?? "";
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 49,
                          width: double.infinity,
                          child: CustomButton(
                            text: LocaleKeys.profileStatus_confirmChangeEmail
                                .tr(),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context
                                    .read<UpdateUserEmailCubit>()
                                    .updateEmail(
                                      newEmail: newEmail,
                                      password: password,
                                    );
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
