import 'package:ecommerce_clean_architecture/features/main/main.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/widgets/custom_seach_text_field.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/widgets/search_body_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/widgets/search_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {

  @override
  void initState() {
    context.read<SearchCubit>().resetSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            SearchBodyAppBar(),
            const SizedBox(height: 16),
            CustomSearchTextField(),
            SearchBodyBlocConsumer(),
          ],
        ),
      ),
    );
  }
}
