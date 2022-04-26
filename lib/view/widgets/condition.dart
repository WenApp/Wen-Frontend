import 'package:flutter/material.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';

class CardConstants {
  static const double widthSF = 0.99;
  static const double heightSF = 0.15;
  static const double borderRadius = 5.0;
}

abstract class ConditionComponent {
  IconData? icon;
  bool selected = false;
  ConditionComponent({@required this.icon});

  Widget build() {
    return IconButton(
        onPressed: () {
          selected = !selected;
        },
        icon: Icon(icon));
  }
}

class LessThanCondition extends ConditionComponent {
  LessThanCondition({IconData? icon}) : super(icon: icon);
}

class GreaterThanCondition extends ConditionComponent {
  GreaterThanCondition({IconData? icon}) : super(icon: icon);
}

class ConditionCard extends StatefulWidget {
  final List<ConditionComponent> conditions = [
    LessThanCondition(icon: Icons.arrow_back_ios),
    GreaterThanCondition(icon: Icons.arrow_forward_ios),
  ];
  ConditionCard({Key? key}) : super(key: key);

  @override
  _ConditionCard createState() => _ConditionCard();
}

class _ConditionCard extends State<ConditionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * CardConstants.widthSF,
      height: MediaQuery.of(context).size.height * CardConstants.heightSF,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(CardConstants.borderRadius))),
      child: Row(
        children: [
          for (ConditionComponent condition in widget.conditions)
            condition.build()
        ],
      ),
    );
  }
}

class AddCondition extends StatefulWidget {
  const AddCondition({Key? key}) : super(key: key);

  @override
  _AddCondition createState() => _AddCondition();
}

class _AddCondition extends State<AddCondition> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Opacity(
          opacity: 0.35,
          child: FDottedLine(
              color: Colors.white,
              space: 10,
              dottedLength: 10,
              corner: FDottedLineCorner.all(5.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.99,
                height: MediaQuery.of(context).size.height * 0.15,
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    ],
                  ),
                  onPressed: () {
                    //Navigator.of(context).push(route);
                  },
                ),
              )),
        ));
  }
}
