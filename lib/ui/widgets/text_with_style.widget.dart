// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWithStyle extends Text {
  TextWithStyle(
      {required String data,
      Color color = Colors.black,
      double size = 10,
      weigth = FontWeight.normal,
      style = FontStyle.normal})
      : super(data,
            style: GoogleFonts.poppins(
                color: color,
                fontSize: size,
                fontWeight: weigth,
                fontStyle: style));
}
