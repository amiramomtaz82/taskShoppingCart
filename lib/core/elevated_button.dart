
import 'package:flutter/material.dart';

import 'colors.dart';



class CustomElevatedButton extends StatelessWidget {
String title;
  Color titleColor;
  Color? backGroundColor;
  Color borderColor;
  VoidCallback onPresed;


  CustomElevatedButton(
      {super.key,
        this.titleColor = Colors.white,
        required this.title,
        this.backGroundColor =Appcolors.blue,
        this.borderColor = Appcolors.blue,
        required this.onPresed});

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(horizontal: 8),
        height: 56,
        child: ElevatedButton(child: Text (title),
          style: ElevatedButton.styleFrom(
              backgroundColor: backGroundColor, // button color
              foregroundColor: titleColor, // text / icon color
              side: BorderSide(color: borderColor, width: 2), // border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),)),

          onPressed: onPresed, )
    );
  }
}
