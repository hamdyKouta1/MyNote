import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomTitleOpenNote extends StatelessWidget {
  String lable;
  TextEditingController customController;
  IconData myIcon;

  CustomTitleOpenNote({
    Key? key,
    required this.customController,
    required this.lable,
    required this.myIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 30,
        height: 1,
        color: Colors.white,
      ) ,
      decoration: InputDecoration(

        hintText: lable,
        hintStyle:const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 30,
          height: 1,
          color: Colors.white,
        ) ,
        suffixIcon:Icon(myIcon,color: Colors.white,),
        filled: true,
        fillColor: mainColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: mainColor),
        ),
      ),
      controller: customController,
    );
  }
}