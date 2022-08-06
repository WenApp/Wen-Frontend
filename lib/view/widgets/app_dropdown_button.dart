import 'package:app/view/util/theme/app_colors.dart';
import 'package:app/view/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDropdownButton extends StatefulWidget {
  final String? value;
  final void Function(dynamic) onChanged;
  final List<DropdownMenuItem> items;
  const AppDropdownButton({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);
  @override
  _AppDropdownButton createState() => _AppDropdownButton();
}

class _AppDropdownButton extends State<AppDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return AppItemContainer(
        child: DropdownButtonHideUnderline(
      child: DropdownButton(
        value: widget.value,
        items: widget.items,
        onChanged: widget.onChanged,
        dropdownColor: AppColors.Jet,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        icon: Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.025),
          child: Icon(
            Icons.arrow_drop_down,
            color: AppColors.SpanishGrey,
          ),
        ),
        style: GoogleFonts.bungee(
          fontSize: 24,
          color: AppColors.SpanishGrey,
        ),
      ),
    ));
  }
}

class AppDropdownButtonItemBody extends StatelessWidget {
  final String title;
  final Icon icon;
  const AppDropdownButtonItemBody({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.025,
            right: MediaQuery.of(context).size.width * 0.025,
          ),
          child: icon,
        ),
        Text(title),
      ],
    );
  }
}
