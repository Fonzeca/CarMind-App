import 'package:flutter/material.dart';

class FormService {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isValidForm(){
    return keyForm.currentState?.validate() ?? false;
  }

}