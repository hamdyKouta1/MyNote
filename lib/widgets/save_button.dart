import 'package:flutter/material.dart';
import 'custom_text.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: const BoxDecoration(
        borderRadius:
        BorderRadius.all(Radius.circular(15)),
        color: Colors.lightGreen,
      ),
      child: Center(
          child: CustomText(
              text: "Save",
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: Colors.white)),
    );
  }
}

