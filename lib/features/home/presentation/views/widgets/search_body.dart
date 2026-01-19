import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_seach_text_field.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/search_cubit/search_state.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/search_body_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/search_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});
  static const String routeName = "SearchBody";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(height: 16),
                    SearchBodyAppBar(),
                    const SizedBox(height: 16),
                    CustomSearchTextField(),
                    const SizedBox(height: 16),
                    SearchBodyBlocBuilder(states: state),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
