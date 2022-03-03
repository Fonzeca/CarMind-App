import 'package:auto_size_text/auto_size_text.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:carmind_app/vehiculo/bloc/vehiculo_bloc.dart';
import 'package:carmind_app/vehiculo/view/card_vehiculo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

import '../../main.dart';

class VehiculoEspecifico extends StatelessWidget {
  BuildContext? context;
  Vehiculo? vehiculo;

  VehiculoEspecifico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;

    BlocProvider.of<VehiculoBloc>(context).add(GetCurrent());
    return BlocBuilder<VehiculoBloc, VehiculoState>(
      builder: (context, state) {
        vehiculo = state.vehiculo;
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
              Builder(
                builder: (context) {
                  if (vehiculo != null || state.loading) {
                    return card_vehiculo(
                      vehiculo: vehiculo,
                      loading: state.loading,
                    );
                  }
                  return _buildNonVehiculo();
                },
              ),
              const SizedBox(height: 44),
              Builder(
                builder: (context) {
                  if (vehiculo == null && !state.loading) {
                    return Container();
                  }
                  return const SizedBox(
                    height: 34,
                    child: Text(
                      "Formularios",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  if (vehiculo == null && !state.loading) return Container();
                  return SingleChildScrollView(
                    child: Column(
                      children: _buildListCheckList(loading: state.loading),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildListCheckList({bool loading = false}) {
    List<Widget> list = [];
    if (loading) {
      list.add(const SizedBox(height: 15));
      list.add(cardCheckListLoading());
      list.add(const SizedBox(height: 15));
      list.add(cardCheckListLoading());
      return list;
    } else {
      for (var pendiente in vehiculo!.pendientes!) {
        list.add(const SizedBox(height: 15));
        list.add(cardCheckList(pendiente.id!, pendiente.titulo!, pendiente.vencimiento!));
      }
      return list;
    }
  }

  Widget cardCheckList(int id, String nombreCheck, int vencmimento) {
    bool tick = vencmimento > 0;
    return GestureDetector(
      onTap: () => buscarEvaluacion(id),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        child: SizedBox(
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 30),
                        child: AutoSizeText(
                          nombreCheck,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        "Vencimiento: $vencmimento día" + (vencmimento == 1 ? "" : "s"),
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SvgPicture.asset(
                      tick ? "assets/tick_fill.svg" : "assets/tick_empty_empty.svg",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardCheckListLoading() {
    return SkeletonItem(
      child: Row(
        children: const [
          Expanded(
            child: SkeletonAvatar(
              style: SkeletonAvatarStyle(
                height: 57,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNonVehiculo() {
    return Column(
      children: [
        const SizedBox(height: 159),
        Row(
          children: [
            SvgPicture.asset("assets/happy_face.svg"),
            const SizedBox(width: 24),
            const Expanded(
              child: Text(
                "No estas conduciendo ningún vehículo",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Color(0xFFC7C7C7)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  buscarEvaluacion(int id) async {
    BlocProvider.of<VehiculoBloc>(context!).add(TapEvaluacion(id, context!));
  }
}
