import 'package:flutter/material.dart';

import '../main.dart';

class CustomShortInput extends StatelessWidget {

  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextEditingController controller;


  const CustomShortInput({Key? key, required this.controller, this.focusNode, this.nextFocus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(10.0),
       child: SizedBox(
          height: 48,
          width: 50,
          child: ValueListenableBuilder(
              valueListenable: ValueNotifier(true),
              builder: (context, value, child) {
                return TextField(
                  onChanged: ((_) => (focusNode != null && nextFocus != null) ? FocusScope.of(context).requestFocus(nextFocus) : null),
                  focusNode: focusNode,
                  maxLength: 1,
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    counterText: '',
                    border:  OutlineInputBorder(),
                    focusedBorder:   OutlineInputBorder(borderSide: BorderSide(color: carMindPrimaryButton, width: 3)),
                    contentPadding:  EdgeInsets.symmetric(vertical: 13, horizontal: 18),

                  ),
                  textAlignVertical: TextAlignVertical.top,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                );
              }),
        ),
     );
    
  }
}