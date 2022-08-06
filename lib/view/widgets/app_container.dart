import 'package:app/constants/alarm_attributes.dart';
import 'package:app/presentation/providers/alarm_provider.dart';
import 'package:app/view/util/navigation_controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:app/view/util/size/app_size.dart';
import 'package:app/view/widgets/candle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:app/data/model/alarm_attribute.dart';

class AppContainerConstants {
  static const double kWidthSF = 0.8;
}

class AppContainer extends StatelessWidget {
  final double height;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final EdgeInsets? padding;
  final Color? color;
  final Widget child;
  const AppContainer({
    Key? key,
    required this.height,
    required this.child,
    this.color,
    this.padding,
    this.borderRadius,
    this.boxShadow,
    this.border,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? AppColors.Jet,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        border: border,
      ),
      width: MediaQuery.of(context).size.width * AppContainerConstants.kWidthSF,
      height: height,
      child: child,
    );
  }
}

class AppItemContainer extends StatefulWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;
  final BoxBorder? border;
  final Function()? onTap;
  const AppItemContainer(
      {Key? key,
      required this.child,
      this.color,
      this.padding,
      this.onTap,
      this.border})
      : super(key: key);

  @override
  _AppItemContainer createState() => _AppItemContainer();
}

class _AppItemContainer extends State<AppItemContainer> {
  final double _borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AppContainer(
        color: widget.color,
        height: MediaQuery.of(context).size.height * 0.075,
        padding: widget.padding,
        border: widget.border,
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        child: widget.child,
      ),
    );
  }
}

class PremiumItemContainer extends StatefulWidget {
  final String headline;
  const PremiumItemContainer({Key? key, required this.headline})
      : super(key: key);
  @override
  _PremiumItemContainer createState() => _PremiumItemContainer();
}

class _PremiumItemContainer extends State<PremiumItemContainer> {
  final double _borderRadius = 2.0;
  double _height = 0.0;

  @override
  Widget build(BuildContext context) {
    // NavigationController navigation =
    //     Provider.of<NavigationController>(context);
    _height = MediaQuery.of(context).size.height * 0.04;
    return AppContainer(
      height: _height,
      borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset.fromDirection(-80.0, 2.0),
          blurRadius: 2,
          spreadRadius: 4,
        ),
      ],
      child: InkWell(
        onTap: () {
          //TODO: plan business model and implement premium popup or premium page
          debugPrint('PREMIUM');
        },
        child: Ink(
          child: Row(
            children: [
              const Spacer(flex: 1),
              Icon(
                Icons.trending_up,
                color: AppColors.Malachite,
                size: _height * 0.75,
              ),
              const Spacer(flex: 1),
              Text(
                widget.headline,
                style: GoogleFonts.bungee(
                  color: AppColors.Malachite,
                  fontSize: 16.0,
                ),
              ),
              const Spacer(flex: 10),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.AmberSAE,
                size: _height * 0.5,
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class AlarmViewItemContainer extends StatefulWidget {
  final Color? candleColor;
  final int? index;
  final bool isStatic;
  final AlarmAttribute? data;
  const AlarmViewItemContainer({
    Key? key,
    required this.isStatic,
    this.index,
    this.candleColor,
    this.data,
  }) : super(key: key);
  @override
  _AlarmViewItemContainer createState() => _AlarmViewItemContainer();
}

class _AlarmViewItemContainer extends State<AlarmViewItemContainer> {
  final double _borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.1;
    double padding = _height * 0.01;
    NavigationController navigation =
        Provider.of<NavigationController>(context);
    AlarmAttributeProvider pAlarmAttribute =
        Provider.of<AlarmAttributeProvider>(context);
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            InkWell(
              onTap: () {
                onEdit(navigation, pAlarmAttribute);
              },
              child: Ink(
                child: Padding(
                  padding: EdgeInsets.only(top: padding, bottom: padding),
                  child: AppContainer(
                    height: _height,
                    borderRadius:
                        BorderRadius.all(Radius.circular(_borderRadius)),
                    child: Row(children: [
                      const Spacer(flex: 2),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.data?.coin ?? '',
                              style: GoogleFonts.bungee(
                                  fontSize: 24, color: Colors.white)),
                          Text(widget.data?.targetPrice ?? '',
                              style: GoogleFonts.quantico(
                                  fontSize: 16, color: AppColors.SpanishGrey)),
                        ],
                      ),
                      const Spacer(flex: 1),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.data?.operatorType.type == Operator.less
                                ? '<='
                                : '>=',
                            style: GoogleFonts.quantico(
                                fontSize: 20, color: AppColors.AmberSAE),
                          ),
                        ],
                      ),
                      const Spacer(flex: 1),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.data?.targetPrice ?? '',
                            style: GoogleFonts.quantico(
                                fontSize: 16, color: AppColors.SpanishGrey),
                          ),
                        ],
                      ),
                      const Spacer(flex: 1),
                    ]),
                  ),
                ),
              ),
            ),
            Candle(
              color: widget.candleColor ?? AppColors.SpanishGrey,
              height: _height,
              width: MediaQuery.of(context).size.width *
                  AppContainerConstants.kWidthSF,
            ),
          ],
        ),
        Divider(
          height: _height * 0.1,
        )
      ],
    );
  }

  void onEdit(
      NavigationController navigation, AlarmAttributeProvider pAlarmAttribute) {
    if (!widget.isStatic) {
      pAlarmAttribute.updateFromLocalStorage(
        widget.data ??
            AlarmAttribute(
              coin: '',
              currency: '',
              targetPrice: '',
              indicatorType: IndicatorType(type: Indicator.price),
              operatorType: OperatorType(type: Operator.greater),
              notificationType: AlertType(type: Alert.alarm),
            ),
      );
      pAlarmAttribute.updateSelectedIndex(widget.index ?? 0);
      navigation.changeScreen('/edit_alarm');
    }
  }
}
