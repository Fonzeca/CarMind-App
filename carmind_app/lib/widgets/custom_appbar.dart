import 'package:flutter/material.dart';

import '../constants.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {

  final void Function() onPressed;
  final String title;


  const CustomAppBar({Key? key, required this.onPressed, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          centerTitle: true,
          backgroundColor: carMindTopBar,
          leading: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(43);
}