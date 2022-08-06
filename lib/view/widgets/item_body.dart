import 'package:app/view/widgets/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/theme/app_colors.dart';

abstract class ItemBody {
  void showBottomSheet(BuildContext context);
}

class CoinSearchItemBody extends StatelessWidget with ItemBody {
  final Icon? icon;
  final String? title, subtitle;
  const CoinSearchItemBody({
    Key? key,
    this.icon,
    this.title,
    this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        showBottomSheet(context);
      }),
      child: Row(
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
                style: GoogleFonts.quantico(
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
      ),
    );
  }

  @override
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.EerieBlack,
      context: context,
      isScrollControlled: true,
      builder: ((context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: const SearchBottomSheet(),
        );
      }),
    );
  }
}

class AlarmAttributeItemBody extends StatelessWidget with ItemBody {
  final Icon? icon;
  final String? title;
  final String itemType;
  const AlarmAttributeItemBody({
    Key? key,
    this.icon,
    this.title,
    required this.itemType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(context);
      },
      child: Row(
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
      ),
    );
  }

  @override
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.EerieBlack,
      context: context,
      builder: ((context) {
        return ItemBottomSheet(
          itemType: itemType,
        );
      }),
    );
  }
}
