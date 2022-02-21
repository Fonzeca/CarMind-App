
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

  ValueNotifier<bool> abierto = ValueNotifier(true);

  seccion_formulario({Key? key, required this.seccion}) : super(key: key);
  AutoScrollController? controller;

  @override
  Widget build(BuildContext context) {

    return BlocListener<RealiazarEvaluacionBloc, RealiazarEvaluacionState>(
      listener: (context, state) {
      },
      child: ValueListenableBuilder(
        valueListenable: abierto,
        builder: (context, value, child) {
          return AnimatedSize(
            duration: Duration(milliseconds: 100),
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xFFBDAAFF)),
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
      content = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Column(
              children: listWidget(),
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
    return Container(
      child: GestureDetector(
        onTap: () {
          abierto.value = !abierto.value;
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: double.infinity,
          child: Text(
            "${seccion.index! + 1}. ${seccion.nombre!}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  List<Widget> listWidget() {
    List<Widget> list = [];
    for (var pregunta in seccion.preguntas!) {
      list.add(Container(height: 1, width: double.infinity, color: Color(0xFFBDAAFF)));

      switch (pregunta.tipo!) {
        case "TX":
          list.add(
            AutoScrollTag(
              index: pregunta.id!,
              controller: FormularioPreguntas.controller!,
              key: ValueKey(pregunta.id!),
              child: PreguntaTX(pregunta: pregunta),
              highlightColor: Colors.black.withOpacity(0.1),
            ),
          );
          break;
        case "F":
          list.add(AutoScrollTag(
            index: pregunta.id!,
            controller: FormularioPreguntas.controller!,
            key: ValueKey(pregunta.id!),
            child: PreguntaF(pregunta: pregunta),
            highlightColor: Colors.black.withOpacity(0.1),
          ));
          break;
        case "S1":
          list.add(AutoScrollTag(
            index: pregunta.id!,
            controller: FormularioPreguntas.controller!,
            key: ValueKey(pregunta.id!),
            child: PreguntaS1(pregunta: pregunta),
            highlightColor: Colors.black.withOpacity(0.1),
          ));
          break;
        case "S2":
          list.add(AutoScrollTag(
            index: pregunta.id!,
            controller: FormularioPreguntas.controller!,
            key: ValueKey(pregunta.id!),
            child: PreguntaS2(pregunta: pregunta),
            highlightColor: Colors.black.withOpacity(0.1),
          ));
          break;
        case "S3":
          list.add(AutoScrollTag(
            index: pregunta.id!,
            controller: FormularioPreguntas.controller!,
            key: ValueKey(pregunta.id!),
            child: PreguntaS3(pregunta: pregunta),
            highlightColor: Colors.black.withOpacity(0.1),
          ));
          break;
        default:
          list.add(Text("Error, pregunta no implementada."));
      }
    }
    return list;
  }
}
