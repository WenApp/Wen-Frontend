import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget> [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {  },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}