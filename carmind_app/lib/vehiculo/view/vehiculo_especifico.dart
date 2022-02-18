import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';

class VehiculoEspecifico extends StatelessWidget {
  const VehiculoEspecifico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(43),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          backgroundColor: carMindTopBar,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 273,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [carMindTopBar, Color(0xFF4218D9)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 36, left: 34),
                  child: Text(
                    "Estas conduciendo:",
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 35),
                  child: Container(
                    height: 147,
                    width: 109,
                    color: const Color(0xFFC4C4C4),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 55),
                  const Text(
                    "Formularios asignados para este \nvehículo:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 32),
                  cardCheckList("Chequeo de ingreso", 15),
                  const SizedBox(height: 15),
                  cardCheckList("Chequeo de finalización", 15)

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Card cardCheckList(String nombreCheck, int vencmimento) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: 292,
        height: 44,
        child: Row(
          children: [
            Container(
              width: 46,
              child: Center(
                child: SvgPicture.asset("assets/formulario_2.svg"),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                  color: carMindAccentColor),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nombreCheck),
                  Text("Vencimiento: $vencmimento días"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
