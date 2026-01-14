import 'dart:io';
import 'package:ecommerce_clean_architecture/core/cubits/update_user_image_cubit/update_user_image_cubit.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_button.dart';
import 'package:ecommerce_clean_architecture/core/widgets/image_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomEditImageButtonSheet extends StatefulWidget {
  const CustomEditImageButtonSheet({super.key});

  @override
  State<CustomEditImageButtonSheet> createState() =>
      _CustomEditImageButtonSheetState();
}

class _CustomEditImageButtonSheetState
    extends State<CustomEditImageButtonSheet> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageField(
              onChange: (value) {
                setState(() {
                  imageFile = value;
                });
              },
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 54,
              width: MediaQuery.sizeOf(context).width * .6,
              child: CustomButton(
                text: "تعديل الصورة",
                onPressed: () {
                  if (imageFile != null) {
                    triggerUpdateUserImageCubit(context);
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void triggerUpdateUserImageCubit(BuildContext context) {
    context.read<UpdateUserImageCubit>().updateUserImage(image: imageFile!);
    Navigator.of(context).pop();
  }
}
