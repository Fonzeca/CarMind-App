import 'package:carmind_app/util/offline_managers/offline_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class OfflineSign extends StatefulWidget {
  final Widget child;
  final FlutterBackgroundService service;

  const OfflineSign({Key? key, required this.child, required this.service}) : super(key: key);

  @override
  State<OfflineSign> createState() => _OfflineSignState();
}

class _OfflineSignState extends State<OfflineSign> {
  double _height = 0;
  Color _backgroundColor = Colors.orange;

  @override
  void initState() {
    widget.service.on(OfflineManager.offlineOnMessage).listen((event) {
      setState(() {
        _height = 25;
        _backgroundColor = Colors.orange;
      });
    });

    widget.service.on(OfflineManager.offlineOffMessage).listen((event) {
      setState(() {
        _backgroundColor = Colors.green;
      });
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          setState(() {
            _height = 0;
          });
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: widget.child),
        AnimatedContainer(
          height: _height,
          color: _backgroundColor,
          width: double.infinity,
          alignment: Alignment.topCenter,
          duration: const Duration(milliseconds: 150),
          child: const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text("Modo sin conexión", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }
}
