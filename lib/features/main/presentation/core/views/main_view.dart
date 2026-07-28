import 'package:ecommerce_clean_architecture/core/widgets/custom_button_navigaton_bar.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/core/widgets/main_view_multi_bloc_provider.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return MainViewMultiBlocProvider(
      child: Scaffold(
        backgroundColor: colorScheme.background,
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: child,
      ),
    );
  }
}
