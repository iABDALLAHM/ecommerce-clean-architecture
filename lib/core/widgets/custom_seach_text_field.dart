import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(20, 0, 0, 0),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            onChanged: (value) {
              context.read<SearchCubit>().searchProducts(searchName: value);
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              border: buildOutlineInputBorder(),
              hintText: "ابحث عن.......",
              hintStyle: AppStyles.textStyle13Regular.copyWith(
                color: Color(0xff949D9E),
              ),
              prefixIcon: SvgPicture.asset(
                fit: BoxFit.scaleDown,
                Assets.imagesSearchIconSvg,
              ),
              suffixIcon: SvgPicture.asset(
                Assets.imagesFilterSearchIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          BlocBuilder<SearchCubit, SearchStates>(
            builder: (context, state) {
              if (state is EmptySearchState) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * .1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22, top: 8),
                      child: Text(
                        "لاتوجد نتائج بحث",
                        style: AppStyles.textStyle13Regular.copyWith(
                          color: Color(0xff949D9E),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: Colors.white),
  );
}
