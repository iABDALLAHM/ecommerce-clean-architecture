import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/is_english_letters.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/save_recent_search_cubit/save_recent_search_sugestions_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/search_cubit/search_cubit.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: colorScheme.shadow, spreadRadius: 4, blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _textEditingController,
            onSubmitted: (value) {
              context.read<SearchCubit>().searchProducts(
                searchName: value,
                languageCode: isEnglishLetters(text: value)
                    ? englishLanguageCode
                    : arabicLanguageCode,
              );
              context
                  .read<SaveRecentSearchSugestionsCubit>()
                  .saveRecentSugestions(recentSugestion: value);
              _textEditingController.clear();
            },
            decoration: InputDecoration(
              fillColor: colorScheme.onPrimary,
              filled: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: buildOutlineInputBorder(
                color: colorScheme.surface,
              ),
              focusedBorder: buildOutlineInputBorder(
                color: colorScheme.surface,
              ),
              border: buildOutlineInputBorder(color: colorScheme.surface),
              hintText: LocaleKeys.home_searchingTextField.tr(),
              hintStyle: AppStyles.textStyle13Regular.copyWith(
                color: colorScheme.surfaceBright,
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
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: color),
      );
}
