import 'package:flutter/material.dart';
import 'package:mynote/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  String lable;
  TextEditingController customController;
  IconData myIcon;

  CustomTextFormField({
    Key? key,
    required this.customController,
    required this.lable,
    required this.myIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width-20,
      height: 60,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         /* Text(lable,style:GoogleFonts.nunito(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 1,
              color: Colors.white,
            ),)),*/
          TextFormField(
            obscureText: false,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: 1,
              color: Colors.white,
            ) ,
            decoration: InputDecoration(

              hintText: lable,
              hintStyle:const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 1,
                color: Colors.white,
              ) ,
              suffixIcon:Icon(myIcon,color: Colors.white,),
              filled: true,
              fillColor: secColor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: secColor),
                borderRadius: const BorderRadius.all(Radius.circular(15))
              ),
            ),
            controller: customController,
          ),
        ],
      ),
    );
  }
}
