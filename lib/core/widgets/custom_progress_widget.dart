import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomProgressWidget extends StatelessWidget {
  const CustomProgressWidget({
    super.key,
    required this.child,
    required this.state,
  });
  final Widget child;
  final bool state;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return ModalProgressHUD(
      progressIndicator: CircularProgressIndicator(color: colorScheme.primary),
      blur: 50,
      color: Colors.transparent,
      inAsyncCall: state,
      child: child,
    );
  }
}
