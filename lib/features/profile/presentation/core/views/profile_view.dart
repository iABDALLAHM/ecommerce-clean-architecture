import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/views/widgets/profile_body_bloc_provider.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileBodyBlocProvider(child: ProfileBody());
  }
}
