import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingOptions extends StatefulWidget {
  const ShippingOptions({super.key});

  @override
  State<ShippingOptions> createState() => _ShippingOptionsState();
}

class _ShippingOptionsState extends State<ShippingOptions> {
  int isSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          onPressed: () {
            setState(() {
              if (isSelected != 0) {
                isSelected = 0;
                context.read<OrderEntity>().payWithCash = true;
              }
            });
          },
          isSelected: isSelected == 0 ? true : false,
          title: "الدفع عند الاستلام",
          subTitle: "التسليم من المكان",
          price:
              context
                  .read<OrderEntity>()
                  .cartEntity
                  .calculateTotalPrice()
                  .round()
                  .toInt() +
              50,
        ),
        const SizedBox(height: 8),
        ShippingItem(
          onPressed: () {
            setState(() {
              if (isSelected != 1) {
                isSelected = 1;
                context.read<OrderEntity>().payWithCash = false;
              }
            });
          },
          isSelected: isSelected == 1 ? true : false,
          title: "اشتري الان وادفع لاحقا",
          subTitle: "يرجي تحديد طريقه الدفع",
          price: context
              .read<OrderEntity>()
              .cartEntity
              .calculateTotalPrice()
              .round()
              .toInt(),
        ),
      ],
    );
  }
}
