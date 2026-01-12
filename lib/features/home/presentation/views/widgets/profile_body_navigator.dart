
import 'package:ecommerce_clean_architecture/features/home/presentation/views/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileBodyNavigator extends StatelessWidget {
  const ProfileBodyNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch(settings.name){
          case "":
          return MaterialPageRoute(builder: (context)=> Placeholder());
          default:
            return MaterialPageRoute(builder: (context)=> ProfileBody());
        }
      },
    );
  }
}