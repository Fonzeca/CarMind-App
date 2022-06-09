import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  final Color shapeColor;
  final Color textColor;
  final String text;
  final void Function() onPressed;

  const CustomElevatedButton({Key? key, required this.shapeColor, required this.onPressed, required this.textColor, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(shapeColor),
                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                onPressed: onPressed,
                child: Text(text, style: TextStyle(color: textColor)),
              ),
            );
  }
}