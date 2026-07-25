import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/function/build_profile_app_bar.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/user_profile_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/user_profile/widgets/user_profile_body.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return UserProfileBlocProvider(
      child: Scaffold(
        appBar: buildProfileAppBar(
          context,
          title: LocaleKeys.profile_userProfileSectionPageAppBar.tr(),
        ),
        body: SafeArea(child: UserProfileBody()),
      ),
    );
  }
}
