import 'package:flutter/material.dart';


class BaseDrawer extends StatelessWidget {
  const BaseDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).dividerColor,
        child:ListView(
          children: <Widget> [
            DrawerHeader(
              child: Container(),
            ),
          ],
        ),
      )
    );
  }
}