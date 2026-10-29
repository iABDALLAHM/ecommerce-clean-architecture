import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/save_recent_search_cubit/save_recent_search_sugestions_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/save_recent_search_cubit/save_recent_search_sugestions_state.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/widgets/recent_search_sugest_widget.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentSearchWidget extends StatefulWidget {
  const RecentSearchWidget({super.key});

  @override
  State<RecentSearchWidget> createState() => _RecentSearchWidgetState();
}

class _RecentSearchWidgetState extends State<RecentSearchWidget> {
  @override
  void initState() {
    context.read<SaveRecentSearchSugestionsCubit>().getSugestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.search_recentSearchResult.tr(),
                style: AppStyles.textStyle13SemiBold,
              ),
              TextButton(
                onPressed: () {
                  context
                      .read<SaveRecentSearchSugestionsCubit>()
                      .clearAllSuggestions();
                },
                child: Text(
                  LocaleKeys.search_deleteAll.tr(),
                  style: AppStyles.textStyle13SemiBold.copyWith(
                    color: colorScheme.tertiaryContainer,
                  ),
                ),
              ),
            ],
          ),

          BlocBuilder<
            SaveRecentSearchSugestionsCubit,
            SaveRecentSearchSugestionsState
          >(
            builder: (context, state) {
              if (state is SuccessGetRecentSugestionsState) {
                return Column(
                  children: state.listOfSugestions.map((e) {
                    return RecentSearchSuggestWidget(lastSearch: e);
                  }).toList(),
                );
              }
              return SizedBox();
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
