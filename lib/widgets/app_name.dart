import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/utils/constants.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Q',
          style: GoogleFonts.nunito(
            color: appGreen,
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'uran',
          style: GoogleFonts.nunito(
            color: appDark,
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
