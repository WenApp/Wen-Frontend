import 'package:app/view/util/theme/app_colors.dart';
import 'package:app/view/widgets/app_nav_bar.dart';
import 'package:app/view/util/navigation_controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView extends StatefulWidget {
  final Widget body;
  const BaseView({Key? key, required this.body}) : super(key: key);
  @override
  _BaseView createState() => _BaseView();
}

class _BaseView extends State<BaseView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NavigationController navigation =
        Provider.of<NavigationController>(context);
    return Scaffold(
      bottomNavigationBar: const AppNavBar(),
      floatingActionButton: Offstage(
          offstage: false,
          child: FloatingActionButton(
            onPressed: () {
              navigation.changeScreen('/add_alarm');
            },
            backgroundColor: AppColors.AmberSAE,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Icon(
              Icons.add,
              color: AppColors.EerieBlack,
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: AppColors.EerieBlack,
      body: SafeArea(
        child: widget.body,
        minimum: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1,
        ),
      ),
    );
  }
}

class BaseOverlayView extends StatefulWidget {
  final Widget body;
  const BaseOverlayView({Key? key, required this.body}) : super(key: key);

  @override
  _BaseOverlayView createState() => _BaseOverlayView();
}

class _BaseOverlayView extends State<BaseOverlayView> {
  @override
  Widget build(BuildContext context) {
    NavigationController navigation =
        Provider.of<NavigationController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.EerieBlack,
        elevation: 0.0,
        actions: [
          IconButton(
              iconSize: 32.0,
              onPressed: () {
                navigation.changeScreen('/alarms');
              },
              icon: Icon(
                Icons.highlight_remove,
                color: AppColors.Jet.shade200,
              ))
        ],
      ),
      backgroundColor: AppColors.EerieBlack,
      body: widget.body,
    );
  }
}
