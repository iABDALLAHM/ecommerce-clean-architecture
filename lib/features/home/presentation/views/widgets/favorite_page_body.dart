import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/sliver_list_items.dart';
import 'package:flutter/widgets.dart';

class FavoritePageBody extends StatelessWidget {
  const FavoritePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [SliverToBoxAdapter(child: const SizedBox(height: 24)),SliverListItems()],
    );
  }
}
