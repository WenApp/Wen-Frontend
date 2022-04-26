import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:app/view/widgets/base_app_bar.dart';
import 'package:app/view/widgets/base_drawer.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key, this.child, this.fab}) : super(key: key);

  final Widget? child;
  final FloatingActionButton? fab;

  @override
  _BasePage createState() => _BasePage();
}

class _BasePage extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: const BaseDrawer(),
      floatingActionButton: widget.fab,
      backgroundColor: Theme.of(context).backgroundColor,
      body: widget.child,
    );
  }
}
