import 'package:ecommerce_clean_architecture/core/functions/show_snack_bar.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/search_cubit/search_cubit.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/search_cubit/search_state.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/widgets/empty_search_widget.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/widgets/recent_search_widget.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/widgets/search_success_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBodyBlocConsumer extends StatelessWidget {
  const SearchBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SuccessSearchState) {
          return SearchSuccessWidget(products: state.productsList);
        } else if (state is EmptySearchState) {
          return EmptySearchWidget();
        } else {
          return RecentSearchWidget();
        }
      },
      listener: (context, state) {
        if (state is FailureSearchState) {
          showSnackBar(context, message: state.errMessage);
        }
      },
    );
  }
}
