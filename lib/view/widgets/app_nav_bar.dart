import 'package:flutter/material.dart';

import 'package:app/view/util/navigation_controller/navigation_controller.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppNavBarButtonController extends ChangeNotifier {
  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class AppNavBarButton extends StatefulWidget {
  final Icon icon;
  final int index;
  final String screen;

  const AppNavBarButton(
      {Key? key, required this.icon, required this.index, required this.screen})
      : super(key: key);

  @override
  _AppNavBarButton createState() => _AppNavBarButton();
}

class _AppNavBarButton extends State<AppNavBarButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppNavBarButtonController controller =
        Provider.of<AppNavBarButtonController>(context);

    return IconButton(
      color: controller.selectedIndex == widget.index
          ? AppColors.Malachite
          : AppColors.Jet.shade200,
      icon: widget.icon,
      onPressed: () {
        controller.setSelectedIndex(widget.index);
        context.go(widget.screen);
      },
    );
  }
}

class AppNavBar extends StatefulWidget {
  const AppNavBar({Key? key}) : super(key: key);

  @override
  _AppNavBar createState() => _AppNavBar();
}

class _AppNavBar extends State<AppNavBar> {
  List<AppNavBarButton> items = [
    const AppNavBarButton(
      icon: Icon(Icons.alarm),
      index: 0,
      screen: '/',
    ),
    const AppNavBarButton(
      icon: Icon(Icons.notifications),
      index: 1,
      screen: '/notifications',
    ),
    const AppNavBarButton(
      icon: Icon(Icons.settings),
      index: 2,
      screen: '/settings_menu',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.EerieBlack,
            spreadRadius: 60.0,
            blurRadius: 35.0,
          )
        ],
      ),
      child: BottomAppBar(
        elevation: 0.0,
        color: AppColors.EerieBlack,
        child: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(children: [...items]),
          ),
        ),
      ),
    );
  }
}
