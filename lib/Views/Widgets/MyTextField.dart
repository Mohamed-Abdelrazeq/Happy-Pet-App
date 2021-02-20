import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    @required this.height,
    @required this.width,
    @required this.myWidth,
    @required this.myHeight,
    this.myController,
    @required this.hint,
    @required this.myIcon,
    @required this.obscureBool,
    @required this.noSpace,
    this.onChangeFunction,
  });

  final double height;
  final double width;
  final double myWidth;
  final double myHeight;
  final TextEditingController myController;
  final String hint;
  final IconData myIcon;
  final bool obscureBool;
  final bool noSpace;
  final Function onChangeFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * .05),
      width: width * myWidth,
      height: myHeight * height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(height * .02)),
      child: Center(
        child: TextField(
          controller: myController,
          keyboardType: TextInputType.multiline,
          onChanged: onChangeFunction,
          obscureText: obscureBool,
          inputFormatters: noSpace ? [BlacklistingTextInputFormatter(
                RegExp(" ")
            )] : [],
          cursorColor: Colors.black87,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: 15, bottom: 11, top: 11, right: 15),
              icon: Icon(
                myIcon,
                color: cSmithApple,
              ),
              hintText: hint,
            ),
        ),
      ),
    );
  }
}

