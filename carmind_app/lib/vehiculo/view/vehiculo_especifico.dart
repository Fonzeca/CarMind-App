import 'package:carmind_app/api/api_client.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';
import 'card_vehiculo.dart';

class VehiculoEspecifico extends StatelessWidget {
  BuildContext? context;
  Vehiculo vehiculo;

  VehiculoEspecifico({Key? key, required this.vehiculo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 59),
          const Text(
            "Estas conduciendo:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24),
          card_vehiculo(
            vehiculo: vehiculo,
          ),
          const SizedBox(height: 44),
          const SizedBox(
            height: 34,
            child: Text(
              "Formularios",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 16),
          cardCheckList("Chequeo de ingreso", 15),
          const SizedBox(height: 15),
          cardCheckList("Chequeo de finalización", 15)
        ],
      ),
    );
  }

  Widget cardCheckList(String nombreCheck, int vencmimento) {
    return GestureDetector(
      onTap: () => buscarEvaluacion(),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        child: SizedBox(
          width: 292,
          height: 57,
          child: Row(
            children: [
              Container(
                width: 59,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/formulario_2.svg",
                    width: 32,
                    height: 32,
                  ),
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                    color: carMindAccentColor),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      nombreCheck,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Vencimiento: $vencmimento días",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buscarEvaluacion() async {
    ApiClient api = ApiClient(staticDio!);
    Evaluacion ev = await api.getEvaluacionById(196);
    BlocProvider.of<HomeBloc>(context!).add(HomeNavigationEvent(4, data: ev));
  }
}
