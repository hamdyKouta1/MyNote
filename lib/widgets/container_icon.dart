import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ContainerIcon extends StatelessWidget {
  IconData myIcon;
  ContainerIcon({
    required this.myIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15),
        ),
        color: secColor,
      ),
      child: Icon(myIcon),
    );
  }
}