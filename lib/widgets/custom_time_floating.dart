
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomTimeFloating extends StatelessWidget {
  const CustomTimeFloating({
    Key? key,
    required this.timeController,
  }) : super(key: key);

  final TextEditingController timeController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(

        hintText: "Enter The Time",
        hintStyle:const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1,
          color: Colors.white,
        ) ,
        suffixIcon:const Icon(Icons.more_time_outlined,color: Colors.white,),
        filled: true,
        fillColor: secColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: secColor),
            borderRadius: const BorderRadius.all(Radius.circular(15))
        ),
      ),
      controller: timeController  ,
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((value) {
          timeController.text = value!.format(context);
        }
        );

      }, validator: (value) {
      if(value!.isEmpty){
        return 'data must not be empty ';
      }
      print(value);
    },
    );
  }
}
