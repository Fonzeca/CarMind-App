import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChechAnimation extends StatefulWidget {
  final String texto;
  const ChechAnimation({Key? key, required this.texto}) : super(key: key);

  @override
  State<ChechAnimation> createState() => _ChechAnimationState();
}

class _ChechAnimationState extends State<ChechAnimation> with TickerProviderStateMixin {
  late final AnimationController _controller;

  bool visible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)..duration = const Duration(milliseconds: 2000);
    events();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF3600FA), Color(0xFF120055)]),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset("assets/lottie/check_animation.json", controller: _controller),
            Container(
              padding: const EdgeInsets.only(top: 200),
              child: AnimatedDefaultTextStyle(
                style: visible
                    ? const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )
                    : const TextStyle(
                        fontSize: 5,
                        color: Colors.white10,
                      ),
                child: Text(widget.texto),
                duration: const Duration(milliseconds: 500),
              ),
            )
          ],
        ),
      ),
    );
  }

  events() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _controller.forward();
    setState(() {
      visible = !visible;
    });
    await Future.delayed(const Duration(milliseconds: 3500));
    Navigator.of(context).pop();
  }
}
