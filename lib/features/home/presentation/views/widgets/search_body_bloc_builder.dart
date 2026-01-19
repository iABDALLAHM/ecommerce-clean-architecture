import 'package:ecommerce_clean_architecture/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/search_cubit/search_state.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/empty_search_widget.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/recent_search_widget.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/search_success_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBodyBlocBuilder extends StatelessWidget {
  const SearchBodyBlocBuilder({super.key, required this.states});
  final SearchStates states;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SuccessSearchState) {
          return SearchSuccessWidget(products: state.productsList);
        } else if (state is EmptySearchState) {
          return EmptySearchWidget();
        } else {
          return RecentSearchWidget();
        }
      },
    );
  }
}
