import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_routes.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/verify_change_email_cubit/verify_change_email_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/verify_change_email_cubit/verify_change_email_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyChangeEmailDialog extends StatelessWidget {
  const VerifyChangeEmailDialog({super.key, required this.code});
  final String code;
  @override
  Widget build(BuildContext context) {
    return VerifyChangeEmailBlocListener(
      child: AlertDialog(
        contentPadding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        content: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 59,
                child: CustomButton(
                  text: "تأكيد تغير الايميل وتسجيل الدخول بالإيميل الجديد",
                  onPressed: () {
                    context.read<VerifyChangeEmailCubit>().confirmChangeEmail(
                      code: code,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyChangeEmailBlocListener extends StatelessWidget {
  const VerifyChangeEmailBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyChangeEmailCubit, VerifyChangeEmailState>(
      listener: (context, state) {
        if (state is SuccessVerifyChangeEmailState) {
          context.pop();
          showSnackBar(
            context,
            message: "تم تغير الإيميل بنجاح برجاء تسجيل الدخول مجددا",
          );
          context.go(AppRoutes.login);
        } else if (state is FailureVerifyChangeEmailState) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      child: child,
    );
  }
}
