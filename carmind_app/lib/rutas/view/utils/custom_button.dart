import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final double height;
  final Color foreGroundColor;
  final Widget child;
  final Color backgroundColor;

  const CustomButton({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.height,
    required this.foreGroundColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(foreGroundColor),
          padding: MaterialStateProperty.all(const EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 10)),
        ),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: height,
            decoration: BoxDecoration(
                color: backgroundColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xffD7D7D7), width: 1)),
            child: child));
  }
}
