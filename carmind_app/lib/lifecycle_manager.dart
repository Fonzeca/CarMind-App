import 'package:flutter/widgets.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  final FlutterBackgroundService service;

  static String KEY_INVOKE_SERVICE = "onChangeLifeCycleState";

  LifeCycleManager({Key? key, required this.child, required this.service}) : super(key: key);
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    widget.service.invoke(LifeCycleManager.KEY_INVOKE_SERVICE, {"state": state.name});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
