import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion.dart';
import 'package:carmind_app/formularios/bloc/formulario_bloc.dart';
import 'package:carmind_app/formularios/view/util/card_formulario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormuarioContent extends StatelessWidget {
  FormuarioContent(BuildContext context) {
    BlocProvider.of<FormularioBloc>(context).add(FormularioBuscarDataEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormularioBloc, FormularioState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 60, left: 35),
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Últimos formularios",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildListCard(state.logs, state.loading),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildListCard(List<LogEvaluacion> logs, bool loading) {
    List<Widget> list = [];
    if (loading) {
      for (var i = 0; i < 5; i++) {
        list.add(const CardFormulario(log: null, loading: true));
        list.add(const SizedBox(width: 12));
      }
      list.removeLast();
    } else {
      for (var log in logs) {
        list.add(CardFormulario(log: log, loading: false));
        list.add(const SizedBox(width: 12));
      }
      list.removeLast();
    }
    return list;
  }
}
