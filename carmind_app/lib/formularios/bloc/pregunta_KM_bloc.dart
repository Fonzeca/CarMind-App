import 'dart:async';

import 'package:flutter/material.dart';

class PreguntaKMBloc{

  final _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream;
  bool hasError = true;
  Color errorColor = const Color(0xFF6F6F6F);


  void updateText(String? text) {

    if(_isFieldEmptyError(text)){
      errorColor = const Color(0xFF6F6F6F);
      _textController.sink.addError("Este campo no puede estar vacío");
      hasError = true;
      return;
    }

    if(_isFieldNotNumberError(text!)){
      errorColor = Colors.red;
      _textController.sink.addError("Debes ingresar un número válido");
      hasError = true;
      return;
    } 
    
    hasError = false;
    _textController.sink.add(text);
  }

  dispose() {
    _textController.close();
  }

  bool _isFieldEmptyError(String? text){
    return text == null || text.isEmpty;
  }

  bool _isFieldNotNumberError(String text){
    return int.tryParse(text) == null;
  }

}
