import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/custom_button_navigaton_bar.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/main_view_body_bloc_consumer.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/multi_main_view_bloc_provider.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = "Main";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentBody = 0;
  @override
  Widget build(BuildContext context) {
    return MultiMainViewBlocProvider(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onChange: (value) {
            currentBody = value;
            setState(() {});
          },
        ),
        body: SafeArea(
          child: MainViewBodyBlocListener(
            child: MainViewBody(currentBody: currentBody),
          ),
        ),
      ),
    );
  }
}
