import 'package:ecommerce_clean_architecture/features/profile/presentation/core/function/build_profile_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/user_profile_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/user_profile_body.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return UserProfileBlocProvider(
      child: Scaffold(
        appBar: buildProfileAppBar(context, title: "الملف الشخصي"),
        body: SafeArea(child: UserProfileBody()),
      ),
    );
  }
}
