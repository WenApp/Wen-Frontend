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
        children: [
          const PremiumItemContainer(headline: "Wen Lambo!"),
          const Spacer(flex: 1),
          Flexible(
            flex: 20,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return UnconstrainedBox(
                  constrainedAxis: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.01),
                    child: AppItemContainer(
                      onTap: () {},
                      child: Row(
                        children: [Container()],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
