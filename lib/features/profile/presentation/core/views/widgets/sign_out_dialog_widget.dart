import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body_dialog_button.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/sign_out_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignOutDialogWidget extends StatelessWidget {
  const SignOutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SignOutDialogBlocListener(
      child: AlertDialog(
        contentPadding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        backgroundColor: Colors.white,
        icon: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.close, size: 30, color: Colors.black),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "هل ترغب في تسجيل الخروج ؟",
                style: AppStyles.textStyle16Bold,
              ),
              const SizedBox(height: 29),
              Row(
                children: [
                  Expanded(
                    child: ProfileBodyDialogButton(
                      hintText: "تأكيد",
                      onPressed: () {
                        context.read<SignOutCubit>().signout();
                      },
                      isPrimary: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ProfileBodyDialogButton(
                      hintText: "لا ارغب",
                      onPressed: () {
                        context.pop();
                      },
                      isPrimary: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
