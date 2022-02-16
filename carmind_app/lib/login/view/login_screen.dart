import 'package:carmind_app/home/view/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder()
            ),
          )
        ),
        TextButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CarMindNavigationBar(),)), 
          child: Text("Ingresa lo mas tranqui.")
        )
      ],
    );
  }
}
