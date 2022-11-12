
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CardNote extends StatelessWidget {
  String title,par,time,date;
  Color color;
  CardNote({
    required this.title,
    required this.par,
    required this.date,
    required this.time,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-20,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CustomText(text: title, fontWeight: FontWeight.w800, fontSize: 28, color: Colors.black)),
            CustomText(text: par,
                fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(text: time, fontWeight: FontWeight.w400, fontSize: 15  , color: Colors.black),
                CustomText(text: date, fontWeight: FontWeight.w400, fontSize: 15  , color: Colors.black),
              ],
            )
          ],
        ),
      ),
    );
  }
}
