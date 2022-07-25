import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/theme/app_colors.dart';

abstract class ItemBodyMixin implements StatelessWidget {
  dynamic Function()? onTap();
}

class CoinSearchItemBody extends StatelessWidget with ItemBodyMixin {
  final Icon? icon;
  final String? title, subtitle;
  final Function() onTapped;
  const CoinSearchItemBody({
    Key? key,
    this.icon,
    this.title,
    this.subtitle,
    required this.onTapped,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Spacer(flex: 1),
        icon ??
            Icon(
              Icons.disabled_by_default,
              color: AppColors.SpanishGrey,
            ),
        const Spacer(flex: 1),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: GoogleFonts.bungee(
                  color: AppColors.SpanishGrey, fontSize: 24.0),
            ),
            Text(
              subtitle ?? '',
              style: GoogleFonts.openSans(
                  color: AppColors.SpanishGrey, fontSize: 16.0),
            )
          ],
        ),
        const Spacer(flex: 10),
        Icon(
          Icons.search,
          color: AppColors.SpanishGrey,
        ),
        const Spacer(flex: 1),
      ],
    );
  }

  @override
  dynamic Function()? onTap() => onTapped;
}

class AlarmAttributeItemBody extends StatelessWidget with ItemBodyMixin {
  final Icon? icon;
  final String? title;
  final Function() onTapped;
  const AlarmAttributeItemBody({
    Key? key,
    this.icon,
    this.title,
    required this.onTapped,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 10,
        ),
        icon ?? const Icon(Icons.disabled_by_default),
        const Spacer(
          flex: 1,
        ),
        Text(
          title ?? '',
          style: GoogleFonts.bungee(
            color: AppColors.SpanishGrey,
            fontSize: 24.0,
          ),
        ),
        const Spacer(
          flex: 10,
        ),
      ],
    );
  }

  @override
  dynamic Function()? onTap() => onTapped;
}
