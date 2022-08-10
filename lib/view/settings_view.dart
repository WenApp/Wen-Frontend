import 'package:app/view/util/navigation_controller/navigation_controller.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:app/view/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsMenuView extends StatefulWidget {
  const SettingsMenuView({Key? key}) : super(key: key);
  @override
  _SettingsMenuView createState() => _SettingsMenuView();
}

class _SettingsMenuView extends State<SettingsMenuView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const PremiumItemContainer(headline: "Wen Binance!"),
          const Spacer(flex: 1),
          settingOption('Settings', '/'),
          const Spacer(flex: 1),
          settingOption('About', '/'),
          const Spacer(flex: 1),
          settingOption('Send Feedback', '/'),
          const Spacer(flex: 15),
        ],
      ),
    );
  }

  Widget settingOption(String title, String route) {
    return AppItemContainer(
      onTap: () {
        //navigationController.changeScreen(route);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Text(
            title,
            style: GoogleFonts.bungee(
              fontSize: 24.0,
              color: AppColors.SpanishGrey,
            ),
          ),
          const Spacer(flex: 1),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.025,
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.AmberSAE.withOpacity(0.5),
              size: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
