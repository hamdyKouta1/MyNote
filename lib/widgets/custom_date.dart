
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';

class CustomDate extends StatelessWidget {
  const CustomDate({
    Key? key,
    required this.dateController,
  }) : super(key: key);

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 1,
        color: Colors.white,
      ) ,
      decoration: InputDecoration(
        hintText: "Enter The Date",
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1,
          color: Colors.white,
        ),
        suffixIcon: Icon(
          Icons.date_range_outlined,
          color: Colors.white,
        ),
        filled: true,
        fillColor: mainColor,
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(width: 3, color: mainColor),
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
        if (value!.isEmpty) {
          return 'data must not be empty ';
        }
        print(value);
      },
    );
  }
}


