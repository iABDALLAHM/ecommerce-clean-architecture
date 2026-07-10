import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/card_entity/card_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MyCardItem extends StatelessWidget {
  const MyCardItem({super.key, required this.cardEntity});
  final CardEntity cardEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color.fromARGB(99, 158, 158, 158)),
        color: Color(0xffF8F8FA),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            cardEntity.cardNumber ?? "",
            style: AppStyles.textStyle16SemiBold.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
          const SizedBox(width: 15),
          // SvgPicture.asset(cardEntity.cardImageType),// لازم احط الصورة الاول عشان تشتغل!!!
        ],
      ),
    );
  }
}
