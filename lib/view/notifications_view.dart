import 'package:app/view/util/theme/app_colors.dart';
import 'package:app/view/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return UnconstrainedBox(
                  constrainedAxis: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.01),
                    child: AppItemContainer(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Spacer(flex: 1),
                          Icon(
                            Icons.alarm,
                            color: AppColors.Malachite,
                            size: 30.0,
                          ),
                          const Spacer(flex: 1),
                          Text(
                            'SOL',
                            style: GoogleFonts.bungee(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(flex: 1),
                          Text(
                            '>=',
                            style: GoogleFonts.quantico(
                              fontSize: 24.0,
                              color: AppColors.AmberSAE,
                            ),
                          ),
                          const Spacer(flex: 1),
                          Text(
                            '40.00',
                            style: GoogleFonts.quantico(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(flex: 1),
                        ],
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
