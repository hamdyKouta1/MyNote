
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_text.dart';

class InfoAlertDialog extends StatelessWidget {
  const InfoAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: mainColor,
      title: CustomText(
        text: 'Notes',
        fontWeight: FontWeight.w800,
        fontSize: 35,
        color: Colors.white,
      ),
      content: CustomText(
        text: 'Designed by Hamdy Kouta',
        fontWeight: FontWeight.w500,
        fontSize: 30,
        color: Colors.white,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Done'),
        ),
      ],
    );
  }
}
