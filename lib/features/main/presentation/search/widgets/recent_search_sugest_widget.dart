import 'package:ecommerce_clean_architecture/core/utils/assets.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/save_recent_search_cubit/save_recent_search_sugestions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RecentSearchSuggestWidget extends StatelessWidget {
  const RecentSearchSuggestWidget({super.key, required this.lastSearch});
  final String lastSearch;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        SvgPicture.asset(Assets.imagesClockTime),
        const SizedBox(width: 10),
        Text(lastSearch),
        Spacer(),
        IconButton(
          onPressed: () {
            context
                .read<SaveRecentSearchSugestionsCubit>()
                .deleteCurrentSuggestion(currentSuggestion: lastSearch);
          },
          icon: Icon(Icons.close, color: colorScheme.onSecondary),
        ),
      ],
    );
  }
}
