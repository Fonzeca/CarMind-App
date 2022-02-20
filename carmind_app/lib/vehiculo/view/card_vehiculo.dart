import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';

class card_vehiculo extends StatelessWidget {
  const card_vehiculo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      width: 140,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.zero,
        color: const Color(0xFFE4E4E4),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)), color: carMindTopBar),
              width: double.infinity,
              height: 139,
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(
                    "assets/iconos_vehiculos/camion.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7, top: 7),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Vehículo 1",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: const [
                        Text(
                          "Activo",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.circle, color: Color(0xFF36A900), size: 14)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
