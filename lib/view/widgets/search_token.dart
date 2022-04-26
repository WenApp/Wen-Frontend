import 'package:app/view/util/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchToken extends StatefulWidget {
  const SearchToken({Key? key}) : super(key: key);

  @override
  _SearchToken createState() => _SearchToken();
}

class _SearchToken extends State<SearchToken> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.99,
        height: MediaQuery.of(context).size.height * 0.2,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.TartOrange),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              //Text("Add Token", style: TextStyle(color: Colors.white)),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
