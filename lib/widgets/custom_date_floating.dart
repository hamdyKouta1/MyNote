
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';

class CustomDateFloating extends StatelessWidget {
  const CustomDateFloating({
    Key? key,
    required this.dateController,
  }) : super(key: key);

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(

        hintText: "Enter The Date",
        hintStyle:const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1,
          color: Colors.white,
        ) ,
        suffixIcon:const Icon(Icons.date_range_outlined,color: Colors.white,),
        filled: true,
        fillColor: secColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: secColor),
            borderRadius: const BorderRadius.all(Radius.circular(15))
        ),
      ),
      controller: dateController, //
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        ).then((value) {
          dateController.text =
              DateFormat.yMMMMd().format(value!);
        });
      },
      validator: (value) {
        if(value!.isEmpty){
          return 'data must not be empty ';
        }
        print(value);
      },
    );
  }
}
