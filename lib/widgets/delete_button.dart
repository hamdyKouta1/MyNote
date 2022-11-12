
import 'package:flutter/material.dart';
import 'custom_text.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
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
        color: Colors.redAccent,
      ),
      child: Center(
          child: CustomText(
              text: "Delete",
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: Colors.white)),
    );
  }
}
