import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/entities/card_entity/card_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyCardItem extends StatelessWidget {
  const MyCardItem({super.key, required this.cardEntity});

  final CardEntity cardEntity;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: colorScheme.onSurfaceVariant),
        color: colorScheme.tertiaryFixedDim,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            cardEntity.cardNumber != null
                ? "${cardEntity.cardNumber!.split("")[0]}${cardEntity.cardNumber!.split("")[1]}${cardEntity.cardNumber!.split("")[2]}${cardEntity.cardNumber!.split("")[3]} **** "
                : "",
            style: AppStyles.textStyle16SemiBold.copyWith(
              color: colorScheme.tertiaryContainer,
            ),
          ),
          const SizedBox(width: 15),
          SvgPicture.network(cardEntity.cardImageType ?? ""),
        ],
      ),
    );
  }
}
