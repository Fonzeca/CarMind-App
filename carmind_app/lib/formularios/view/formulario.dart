import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:carmind_app/formularios/bloc/realiazar_evaluacion_bloc.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_F.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_S1.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_S2.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_S3.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_TX.dart';
import 'package:carmind_app/formularios/view/util/check_animation.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FormularioPreguntas extends StatelessWidget {
  final Evaluacion evaluacion;
  final Vehiculo vehiculo;

  FormularioPreguntas({Key? key, required dynamic evalua, required this.vehiculo})
      : assert(evalua is Evaluacion),
        evaluacion = evalua,
        super(key: key);

  static ScrollController? controller;
  static ScrollToId? scrollToId;

  ValueNotifier<bool> finishEvaluacionEnabled = ValueNotifier(false);
  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    controller = ScrollController();
    scrollToId = ScrollToId(scrollController: controller);

    BlocProvider.of<RealiazarEvaluacionBloc>(context).add(IniciarEvaluacionEvent(evaluacion, vehiculo));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(43),
        child: AppBar(
          backgroundColor: carMindTopBar,
          leading: IconButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(const PopEvent());
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: Text(
            evaluacion.titulo!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: BlocListener<RealiazarEvaluacionBloc, RealiazarEvaluacionState>(
        listener: (context, state) {
          if (state.preguntasRespondidas.length == evaluacion.preguntas!.length) {
            finishEvaluacionEnabled.value = true;
          }
          if (state.evaluacionTerminada) {
            finalizarFormulario(context);
          }
          if (state.mandandoEvaluacion) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              BlocBuilder<RealiazarEvaluacionBloc, RealiazarEvaluacionState>(
                builder: (context, state) {
                  //Esto se hizo asi, para que cada indicador tenga un maximo de width
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: evaluacion.preguntas!.length * (80 + 2),
                    ),
                    child: StepProgressIndicator(
                      totalSteps: evaluacion.preguntas!.length,
                      selectedColor: carMindAccentColor,
                      currentStep: state.preguntasRespondidas.length,
                      unselectedColor: const Color(0xFFCDCDCD),
                    ),
                  );
                },
              ),
              const SizedBox(height: 34 - 8),
              Flexible(
                flex: 2,
                child: InteractiveScrollViewer(
                  scrollToId: scrollToId,
                  scrollDirection: Axis.vertical,
                  children: listPreguntas(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ScrollContent> listPreguntas() {
    List<ScrollContent> list = [];
    for (var pregunta in evaluacion.preguntas!) {
      // list.add(Container(height: 1, width: double.infinity, color: const Color(0xFFBDAAFF)));

      switch (pregunta.tipo!) {
        case "TX":
          list.add(ScrollContent(
            id: pregunta.id!.toString(),
            child: PreguntaTX(pregunta: pregunta),
          ));
          break;
        case "F":
          list.add(ScrollContent(
            id: pregunta.id!.toString(),
            child: PreguntaF(pregunta: pregunta),
          ));
          break;
        case "S1":
          list.add(ScrollContent(
            id: pregunta.id!.toString(),
            child: PreguntaS1(pregunta: pregunta),
          ));
          break;
        case "S2":
          list.add(ScrollContent(
            id: pregunta.id!.toString(),
            child: PreguntaS2(pregunta: pregunta),
          ));
          break;
        case "S3":
          list.add(ScrollContent(
            id: pregunta.id!.toString(),
            child: PreguntaS3(pregunta: pregunta),
          ));
          break;
      }
    }

    list.add(ScrollContent(child: _buildFinishButton(), id: 'finish'));
    return list;
  }

  SizedBox _buildFinishButton() {
    return SizedBox(
      width: double.infinity,
      child: ValueListenableBuilder<bool>(
        valueListenable: finishEvaluacionEnabled,
        builder: (context, enabled, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: enabled ? carMindPrimaryButton : const Color(0xFFB9B9B9),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1).withOpacity(0.25), blurRadius: 2, offset: const Offset(0, 2))]),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: enabled ? () => enviarFormulario() : null,
                    child: Container(
                      height: 38,
                      width: 145,
                      child: Text(
                        "Enviar formulario",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: enabled ? const Color(0xFF1C1C1C) : const Color(0xFF6F6F6F),
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }

  enviarFormulario() async {
    BlocProvider.of<RealiazarEvaluacionBloc>(context!).add(const FinalizarEvaluacionEvent());
    finishEvaluacionEnabled.value = false;
  }

  void finalizarFormulario(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ChechAnimation(texto: "Completaste el formulario")));
    await Future.delayed(const Duration(milliseconds: 300));
    BlocProvider.of<HomeBloc>(context)
      ..add(const PopEvent())
      ..add(ShowFab());
  }
}
