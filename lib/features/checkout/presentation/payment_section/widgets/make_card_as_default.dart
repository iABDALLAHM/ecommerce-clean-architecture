import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class MakeCardAsDefault extends StatefulWidget {
  const MakeCardAsDefault({super.key, required this.isSelected});
  final ValueChanged<bool> isSelected;
  @override
  State<MakeCardAsDefault> createState() => _MakeCardAsDefaultState();
}

class _MakeCardAsDefaultState extends State<MakeCardAsDefault> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
            widget.isSelected(isSelected);
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: Colors.transparent)
                  : Border.all(color: colorScheme.tertiaryFixed),
              borderRadius: BorderRadius.circular(8),
              color: isSelected ? colorScheme.primary : colorScheme.onPrimary,
            ),
            child: isSelected
                ? Icon(Icons.check, size: 20, color: colorScheme.onPrimary)
                : Icon(null, size: 20, color: colorScheme.surface),
          ),
        ),
        const SizedBox(width: 16),
        Text(LocaleKeys.checkOut_paymentSaveSwitch.tr()),
      ],
    );
  }
}
