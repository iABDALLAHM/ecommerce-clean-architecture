import 'package:ecommerce_clean_architecture/features/main/presentation/notification/views/widgets/notification_bloc_provider.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/notification/views/widgets/notification_view_body.dart';
import 'package:flutter/widgets.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationBlocProvider(
      child: SafeArea(child: NotificationViewBody()),
    );
  }
}
