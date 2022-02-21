import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/formularios/bloc/realiazar_evaluacion_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'seccion_formulario.dart';

class FormularioPreguntas extends StatelessWidget {
  final Evaluacion evaluacion;

  FormularioPreguntas({Key? key, required dynamic evalua})
      : assert(evalua is Evaluacion),
        evaluacion = evalua,
        super(key: key);

  static AutoScrollController? controller;

  @override
  Widget build(BuildContext context) {
    controller = AutoScrollController(
      //add this for advanced viewport boundary. e.g. SafeArea
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),

      //choose vertical/horizontal
      axis: Axis.vertical,

      //this given value will bring the scroll offset to the nearest position in fixed row height case.
      //for variable row height case, you can still set the average height, it will try to get to the relatively closer offset
      //and then start searching.
      suggestedRowHeight: 200,
    );

    BlocProvider.of<RealiazarEvaluacionBloc>(context).add(IniciarEvaluacionEvent(evaluacion));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(43),
        child: AppBar(
          backgroundColor: carMindTopBar,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        ),
      ),
      body: Padding(
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
            StepProgressIndicator(
              totalSteps: evaluacion.secciones!.length,
              selectedColor: carMindAccentColor,
              unselectedColor: const Color(0xFFCDCDCD),
            ),
            const SizedBox(height: 34 - 8),
            Expanded(
              child: SingleChildScrollView(
                controller: controller,
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: listSecciones(),
                ),
              ),
            ),
          ],
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
      ));
    }
    list.add(Container(color: Colors.green, width: double.infinity, height: 400));
    return list;
  }
}
