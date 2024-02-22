import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class IdCardWidget extends StatelessWidget {
  const IdCardWidget({
    Key? key,
    required this.title,
    this.iconSize,
    this.imagePath,
    required this.hasIcon,
    this.icon,
  }) : super(key: key);
  final IconData? icon;
  final bool hasIcon;
  final String? imagePath;
  final String title;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hasIcon
            ? Icon(
                icon,
                color: Colors.black.withOpacity(0.5),
                size: iconSize ?? 0,
              )
            : Image.asset(imagePath!),
        10.height,
        Text(
          title,
          style: 
            boldTextStyle(size: 24, color: black)
          
        )
      ],
    );
  }
}
