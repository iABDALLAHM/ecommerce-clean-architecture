import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/functions/is_english_letters.dart';
import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/save_recent_search_cubit/save_recent_search_suggestions_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RecentSearchSuggestWidget extends StatelessWidget {
  const RecentSearchSuggestWidget({
    super.key,
    required this.lastSearch,
    required this.searchController,
  });
  final String lastSearch;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        searchController.text = lastSearch;
        context.read<SearchCubit>().searchProducts(
          searchName: lastSearch,
          languageCode: isEnglishLetters(text: lastSearch)
              ? englishLanguageCode
              : arabicLanguageCode,
        );
      },
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesClockTime),
          const SizedBox(width: 10),
          Text(lastSearch),
          Spacer(),
          IconButton(
            onPressed: () {
              context
                  .read<SaveRecentSearchSuggestionsCubit>()
                  .deleteCurrentSuggestion(currentSuggestion: lastSearch);
            },
            icon: Icon(Icons.close, color: colorScheme.onSecondary),
          ),
        ],
      ),
    );
  }
}
