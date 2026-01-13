import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/core/services/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/sign_out_cubit/sign_out_states.dart';
import 'package:ecommerce_clean_architecture/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> showMyDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => SignOutCubit(authRepo: getIt.get<AuthRepo>()),
        child: Builder(
          builder: (context) {
            return BlocListener<SignOutCubit, SignOutStates>(
              listener: (context, state) {
                if (state is SuccessSignOutState) {
                  handleSuccessSignOut(context);
                } else if (state is FailureSignOutState) {
                  showSnackBar(context, message: "فشل تسجيل الخروج");
                }
              },
              child: AlertDialog(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                backgroundColor: Colors.white,
                icon: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
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
                            child: CustomDialogButton(
                              hintText: "تأكيد",
                              onPressed: () {
                                context.read<SignOutCubit>().signout();
                              },
                              isPrimary: true,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomDialogButton(
                              hintText: "لا ارغب",
                              onPressed: () {
                                Navigator.of(context).pop();
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
          },
        ),
      );
    },
  );
}

void handleSuccessSignOut(BuildContext context) {
  showSnackBar(context, message: "تم تسجيل الخروج بنجاح");
  Navigator.of(context).pop();
  Navigator.of(context).pushReplacementNamed(LoginView.routeName);
}
