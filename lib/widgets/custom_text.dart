import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  double fontSize;
  Color color=Colors.white;
  CustomText({
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.nunito(
        textStyle: TextStyle(
            fontSize:fontSize ,
            fontWeight:fontWeight ,
            color: color
        )
    ),);
  }
}