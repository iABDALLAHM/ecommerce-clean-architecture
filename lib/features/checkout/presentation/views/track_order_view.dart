import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:ecommerce_clean_architecture/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/views/widgets/track_order_view_body.dart';
import 'package:flutter/material.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});
  static const String routeName = "trackOrder";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTrackOrderAppBar(),
      body: TrackOrderViewBody(),
    );
  }

  AppBar buildTrackOrderAppBar() {
    return AppBar(
      leading: CustomArrowBack(),
      centerTitle: true,
      title: Text("تتبع الطلب", style: AppStyles.textStyle19Bold),
    );
  }
}
