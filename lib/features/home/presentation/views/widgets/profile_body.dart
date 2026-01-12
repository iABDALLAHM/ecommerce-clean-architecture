import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_body_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          ProfileBodyAppBar(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

