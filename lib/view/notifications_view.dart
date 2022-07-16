import 'package:app/view/widgets/app_container.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  _NotificationsView createState() => _NotificationsView();
}

class _NotificationsView extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          PremiumContainer(headline: "Wen Lambo!"),
        ],
      ),
    );
  }
}
