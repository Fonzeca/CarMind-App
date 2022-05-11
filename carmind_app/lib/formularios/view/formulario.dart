import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:carmind_app/formularios/bloc/realiazar_evaluacion_bloc.dart';
import 'package:carmind_app/formularios/view/util/check_animation.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'seccion_formulario.dart';

class FormularioPreguntas extends StatelessWidget {
  final Evaluacion evaluacion;
  final Vehiculo vehiculo;

  FormularioPreguntas({Key? key, required dynamic evalua, required this.vehiculo})
      : assert(evalua is Evaluacion),
        evaluacion = evalua,
        super(key: key);

  static AutoScrollController? controller;

  ValueNotifier<bool> finishEvaluacionEnabled = ValueNotifier(false);
  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    controller = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
      suggestedRowHeight: 200,
    );

    BlocProvider.of<RealiazarEvaluacionBloc>(context).add(IniciarEvaluacionEvent(evaluacion, vehiculo));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(43),
        child: AppBar(
          backgroundColor: carMindTopBar,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
        ),
      ),
      body: BlocListener<RealiazarEvaluacionBloc, RealiazarEvaluacionState>(
        listener: (context, state) {
          if (state.seccionesTerminadas.length == evaluacion.secciones!.length) {
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
              const SizedBox(height: 37),
              Text(
                evaluacion.titulo!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              BlocBuilder<RealiazarEvaluacionBloc, RealiazarEvaluacionState>(
                buildWhen: (previous, current) {
                  return previous.seccionesTerminadas.length != current.seccionesTerminadas.length;
                },
                builder: (context, state) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: evaluacion.secciones!.length * (80 + 2),
                    ),
                    child: StepProgressIndicator(
                      totalSteps: evaluacion.secciones!.length,
                      selectedColor: carMindAccentColor,
                      currentStep: state.seccionesTerminadas.length,
                      unselectedColor: const Color(0xFFCDCDCD),
                    ),
                  );
                },
              ),
              const SizedBox(height: 34 - 8),
              Flexible(
                flex: 2,
                child: SingleChildScrollView(
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: listSecciones(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> listSecciones() {
    List<Widget> list = [];
    for (var seccion in evaluacion.secciones!) {
      list.add(const SizedBox(height: 8));
      list.add(seccion_formulario(
        seccion: seccion,
        index: evaluacion.secciones?.indexOf(seccion) ?? 0,
      ));
    }
    list.add(_buildFinishButton());
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
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 2, offset: const Offset(0, 2))]),
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
