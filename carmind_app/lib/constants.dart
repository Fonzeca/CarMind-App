import 'package:flutter/material.dart';

const carMindAccentColor = Color(0xff8ed8f8);
const carMindAccent2Color = Color(0xff0078FF);
const carMindPrimaryButton = Color(0xffB6E802);
const carMindTopBar = Color(0xff000853);
const carMindGrey = Color(0xff212121);
const String dateFormat = 'dd/MM/yyyy';
const String dateTimeFormat = 'dd/MM/yyyy HH:mm:ss';
const String dateTimeFormatNoSeconds = 'dd/MM/yyyy HH:mm';
const String androidPlatform = 'Play_Store';
const String iosPlatform = 'App_Store';
const Map<String, String> appStoreLinks = {
  'Play_Store': 'https://play.google.com/store/apps/details?id=com.mindia.carmind_app&hl=es_AR',
  'App_Store': 'https://apps.apple.com/ar/app/carmind/id1621077892'
};

const titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
const subtitleStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w400);

const expiredSessionError = "La sesión expiró";
const noInternet = "No hay conexión a internet";
const changeMode = "Cambiando al modo offline";
const noMemoryError = "Tu dispositivo se quedó sin memoria y cerró CarMind";
const noFMTokenError = "No se pudo obtener el token de Firebase Messaging";

const noVehicle = "No se pudo encontrar el vehículo";
const noVehicles = "No hay registro de ningún vehículo, contacte con su administrador";
const noEvaluations = "No hay registro de ningúna evaluación, contacte con su administrador";
const noEvaluation = "No se pudo encontrar la evaluación";
const noEvaluationAssigned = "La evaluacion realizada, no la tiene asignada el vehiculo actual.";
const answersNotMatching = "Las preguntas respondidas no concuerdan con la evaluacion.";
const noQuestion = "No se pudo encontrar la pregunta";
const noQuestions = "No hay registro de ninguna pregunta, contacte con su administrador";
