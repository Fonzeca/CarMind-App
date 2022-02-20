import 'dart:developer';

import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/formularios/bloc/realiazar_evaluacion_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class PreguntaF extends StatelessWidget {
  final PreguntaPojo pregunta;
  ValueNotifier<bool> reconstruye = ValueNotifier(false);

  final ImagePicker _picker = ImagePicker();
  PreguntaF({Key? key, required this.pregunta}) : super(key: key);

  bool? preguntaEnabled;

  bool preguntaFinalizada = false;

  String? photoName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealiazarEvaluacionBloc, RealiazarEvaluacionState>(
      builder: (context, state) {
        preguntaEnabled = state.preguntaActual == pregunta.id || state.preguntasRespondidas.contains(pregunta.id);

        return Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  pregunta.descripcion!,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 30,
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: preguntaEnabled! ? null : const Color(0xFFEEEEEE),
                child: GestureDetector(
                  onTap: preguntaEnabled!
                      ? () async {
                          final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                          if (photo != null) {
                            photoName = photo.name;
                            log("$photoName");
                            preguntaFinalizada = true;
                            reconstruye.value = !reconstruye.value;
                            BlocProvider.of<RealiazarEvaluacionBloc>(context).add(FinalizarPreguntaEvent(pregunta.id!));
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
                          padding: EdgeInsets.symmetric(horizontal: 20 - 10),
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
              const SizedBox(height: 15 - 10),
            ],
          ),
        );
      },
    );
  }
}
