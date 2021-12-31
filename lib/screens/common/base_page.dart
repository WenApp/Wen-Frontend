import 'package:flutter/material.dart';
import 'package:app/widgets/base_app_bar.dart';
import 'package:app/widgets/base_drawer.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  _BasePage createState() => _BasePage();
}

class _BasePage extends State<BasePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: const BaseDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(

      ),
    );
  }
}