import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_edit_image_button_sheet.dart';
import 'package:flutter/material.dart';

PersistentBottomSheetController showEditImageBottomSheet({
  required BuildContext context,
}) {
  return showBottomSheet(
    context: context,
    builder: (context) => CustomEditImageButtonSheet(),
  );
}
