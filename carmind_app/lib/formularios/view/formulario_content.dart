import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/formularios.dart';



class FormularioContent extends StatelessWidget {
  const FormularioContent({Key? key}) : super(key: key);

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
              const Text(
                "Últimos formularios",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 24),
              Builder(builder: (context) {
                if (state.logs.isEmpty) {
                  return _buildNonFormulario();
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _buildListCard(state.logs, state.loading),
                  ),
                );
              })
            ],
          ),
        );
      },
    );
  }

  Widget _buildNonFormulario() {
    return Row(
      children: [
        SvgPicture.asset("assets/happy_face.svg"),
        const SizedBox(width: 24),
        const Expanded(
          child: Text(
            "Aún no completaste ningún formulario.",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Color(0xFFC7C7C7)),
          ),
        ),
      ],
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
      if (logs.isNotEmpty) list.removeLast();
    }
    return list;
  }
}
