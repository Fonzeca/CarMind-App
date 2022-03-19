import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/formularios/bloc/realiazar_evaluacion_bloc.dart';
import 'package:carmind_app/formularios/view/formulario.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_F.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_S1.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_S2.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_S3.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_TX.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class seccion_formulario extends StatelessWidget {
  final SeccionPojo seccion;
  final int index;

  ValueNotifier<bool> abierto = ValueNotifier(true);

  seccion_formulario({Key? key, required this.seccion, required this.index}) : super(key: key);
  AutoScrollController? controller;

  List<Widget>? listPreguntas;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RealiazarEvaluacionBloc, RealiazarEvaluacionState>(
      listener: (context, state) {
        if (state.seccionesTerminadas.contains(seccion.id)) {
          abierto.value = false;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: abierto,
        builder: (context, value, child) {
          return AnimatedSize(
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xFFBDAAFF)),
              ),
              child: Material(
                child: _buildContent(context),
                color: Colors.transparent,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    Widget? content;

    if (abierto.value) {
      listPreguntas ??= listWidget();

      content = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Column(
              children: listPreguntas!,
            ),
          ),
        ],
      );
    } else {
      content = _buildHeader(context);
    }
    return content;
  }

  Widget _buildHeader(BuildContext context) {
    return GestureDetector(
      onTap: () {
        abierto.value = true;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        width: double.infinity,
        child: Text(
          "${index + 1}. ${seccion.nombre!}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  List<Widget> listWidget() {
    List<Widget> list = [];
    for (var pregunta in seccion.preguntas!) {
      list.add(Container(height: 1, width: double.infinity, color: const Color(0xFFBDAAFF)));

      switch (pregunta.tipo!) {
        case "TX":
          list.add(
            AutoScrollTag(
              index: pregunta.id!,
              controller: FormularioPreguntas.controller!,
              key: ValueKey(pregunta.id!),
              child: PreguntaTX(pregunta: pregunta),
              highlightColor: Colors.black,
            ),
          );
          break;
        case "F":
          list.add(AutoScrollTag(
            index: pregunta.id!,
            controller: FormularioPreguntas.controller!,
            key: ValueKey(pregunta.id!),
            child: PreguntaF(pregunta: pregunta),
            highlightColor: Colors.black,
          ));
          break;
        case "S1":
          list.add(AutoScrollTag(
            index: pregunta.id!,
            controller: FormularioPreguntas.controller!,
            key: ValueKey(pregunta.id!),
            child: PreguntaS1(pregunta: pregunta),
            highlightColor: Colors.black,
          ));
          break;
        case "S2":
          list.add(AutoScrollTag(
            index: pregunta.id!,
            controller: FormularioPreguntas.controller!,
            key: ValueKey(pregunta.id!),
            child: PreguntaS2(pregunta: pregunta),
            highlightColor: Colors.black,
          ));
          break;
        case "S3":
          list.add(AutoScrollTag(
            index: pregunta.id!,
            controller: FormularioPreguntas.controller!,
            key: ValueKey(pregunta.id!),
            child: PreguntaS3(pregunta: pregunta),
            highlightColor: Colors.black,
          ));
          break;
        default:
          list.add(const Text("Error, pregunta no implementada."));
      }
    }
    return list;
  }
}
