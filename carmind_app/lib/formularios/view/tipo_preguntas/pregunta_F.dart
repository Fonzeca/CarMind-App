import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../../constants.dart';
import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/formularios.dart';



class PreguntaF extends StatelessWidget with PreguntaInterface {
  final PreguntaPojo pregunta;
  ValueNotifier<bool> reconstruye = ValueNotifier(false);

  final ImagePicker _picker = ImagePicker();
  PreguntaF({Key? key, required this.pregunta}) : super(key: key);

  bool? preguntaEnabled;

  bool preguntaFinalizada = false;

  String? photoName;
  String? photoBase64;

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<RealizarEvaluacionBloc, RealizarEvaluacionState>(
      builder: (context, state) {
        final RealizarEvaluacionBloc realizarEvaluacionBloc = BlocProvider.of<RealizarEvaluacionBloc>(context);
        if(state.restoredData != null){
          FormularioPreguntas.scrollToId?.animateTo(pregunta.id.toString(), duration: const Duration(milliseconds: 100), curve: Curves.ease);
          _photoToString(state.restoredData!);
          preguntaFinalizada = true;
        }
        preguntaEnabled = state.preguntaActual == pregunta.id || state.preguntasRespondidas.contains(pregunta.id);
        return PreguntaBase(
          preguntaEnabled: preguntaEnabled!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  pregunta.descripcion!,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: preguntaEnabled! ? null : const Color(0xFFEEEEEE),
                child: GestureDetector(
                  onTap: preguntaEnabled!
                      ? () async {
                          try {

                            final XFile? photo = await _picker.pickImage(source: ImageSource.camera, imageQuality: 20);

                            if (photo != null) {
                              photoName = photo.name;

                              _photoToString(photo);

                              preguntaFinalizada = true;
                              reconstruye.value = !reconstruye.value;
                              realizarEvaluacionBloc.add(FinalizarPreguntaEvent(pregunta.id!, setearRespuesta()));
                            }
                          } on PlatformException catch (e) {
                            EasyLoading.showError(e.message ?? "Error en camara");
                            FirebaseCrashlytics.instance.recordError(
                              'Detalles: ${e.details} Mensaje: ${e.message}',
                              StackTrace.current,
                              reason: 'Error en la cámara'
                            );
                          }
                        }
                      : null,
                  child: ValueListenableBuilder(
                    valueListenable: reconstruye,
                    builder: (context, value, child) {
                      return TextField(
                        maxLines: 1,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
                        controller: TextEditingController(text: photoName ?? ""),
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                          hintText: "Tomar foto...",
                          border: const OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.camera_alt,
                            color: preguntaEnabled! ? carMindAccent2Color : const Color(0xFF8B8B8B),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 15 - 10),
              ValueListenableBuilder(
                valueListenable: reconstruye,
                builder: (context, value, child) {
                  return preguntaFinalizada
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20 - 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/tick_fill.svg",
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox();
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  void _photoToString(XFile photo) async {
    var imageBytes = await photo.readAsBytes();
    photoBase64 = base64Encode(imageBytes);
  }

  @override
  RespuestaPojo setearRespuesta() {
    RespuestaPojo res = RespuestaPojo();
    res.pregunta_id = pregunta.id;
    res.base64_image = photoBase64;
    return res;
  }
}
