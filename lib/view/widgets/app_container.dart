import 'package:app/view/util/navigation_controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppContainer extends StatelessWidget {
  final double height;
  final BorderRadius? borderRadius;
  final Widget child;
  const AppContainer(
      {Key? key, required this.height, required this.child, this.borderRadius})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.Jet,
        borderRadius: borderRadius,
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      height: height,
      child: child,
    );
  }
}

class PremiumContainer extends StatefulWidget {
  final String headline;
  const PremiumContainer({Key? key, required this.headline}) : super(key: key);
  @override
  _PremiumContainer createState() => _PremiumContainer();
}

class _PremiumContainer extends State<PremiumContainer> {
  double _height = 0.0;

  @override
  Widget build(BuildContext context) {
    // NavigationController navigation =
    //     Provider.of<NavigationController>(context);
    _height = MediaQuery.of(context).size.height * 0.04;
    return AppContainer(
      height: _height,
      borderRadius: const BorderRadius.all(Radius.circular(2.0)),
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

class AlarmViewContainer extends StatefulWidget {
  const AlarmViewContainer({Key? key}) : super(key: key);
  @override
  _AlarmViewContainer createState() => _AlarmViewContainer();
}

class _AlarmViewContainer extends State<AlarmViewContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: route to edit alarm view page
      },
      child: Ink(
        child: AppContainer(
          height: MediaQuery.of(context).size.height * 0.125,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Column(children: [Row(), Row()]),
        ),
      ),
    );
  }
}
