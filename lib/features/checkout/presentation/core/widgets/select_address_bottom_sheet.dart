import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/address_cubit/address_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/address_cubit/address_state.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_cubit.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/widgets/custom_address_card.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectAddressBottomSheet extends StatefulWidget {
  const SelectAddressBottomSheet({super.key, required this.controller});
  final PageController controller;

  @override
  State<SelectAddressBottomSheet> createState() =>
      _SelectAddressBottomSheetState();
}

class _SelectAddressBottomSheetState extends State<SelectAddressBottomSheet> {
  int currentIndex = 0;
  ShippingAddressEntity? shippingAddressEntity;

  @override
  Widget build(BuildContext context) {
    var checkOutCubit = context.read<CheckOutCubit>();
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFCBD5E1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 14),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xFFDCFCE7),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: colorScheme.primary,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.selectAddressBottomSheet_deliveryDestination
                            .tr(),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        LocaleKeys.selectAddressBottomSheet_selectAddress.tr(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Color(0xFF64748B),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F5F9),
                    padding: const EdgeInsets.all(6),
                    minimumSize: const Size(34, 34),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  LocaleKeys.selectAddressBottomSheet_selectAddress.tr(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: Color(0xFF64748B),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    widget.controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    context.pop();
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add, size: 14, color: colorScheme.primary),
                        SizedBox(width: 4),
                        Text(
                          LocaleKeys.selectAddressBottomSheet_savedAddresses
                              .tr(),
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          Flexible(
            child: BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                if (state is GetAddressesSuccessState) {
                  return ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 6,
                    ),
                    itemCount: state.addresses.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final address = state.addresses[index];
                      final isSelected = (currentIndex == index);

                      return CustomAddressCard(
                        isSelected: isSelected,
                        shippingAddressEntity: address,
                        onTap: () {
                          currentIndex = index;
                          shippingAddressEntity = address;
                          setState(() {});
                        },
                      );
                    },
                  );
                } else if (state is GetAddressesLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return Center(child: Text("لايوجد عنواين لديك اضف عنوان جديد"));
              },
            ),
          ),

          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  var address = shippingAddressEntity;
                  if (address != null) {
                    checkOutCubit.updateShippingAddress(address: address);
                    widget.controller.jumpToPage(2);
                    context.pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                icon: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                label: Text(
                  LocaleKeys.selectAddressBottomSheet_ConfirmAndDeliverHere
                      .tr(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
