import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

import '../../main.dart';

class card_vehiculo extends StatelessWidget {
  final Vehiculo? vehiculo;
  final bool loading;

  const card_vehiculo({Key? key, required this.vehiculo, this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      isLoading: loading,
      skeleton: loadingCard(),
      child: _normalCard(),
    );
  }

  Widget _normalCard() {
    if (loading) return Container();
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
                    Text(
                      "${vehiculo!.nombre}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          vehiculo!.en_uso! ? "En uso" : "Disponible",
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.circle, color: vehiculo!.en_uso! ? const Color(0xFFDC0404) : const Color(0xFF36A900), size: 14)
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

  Widget loadingCard() {
    return const SkeletonAvatar(
      style: SkeletonAvatarStyle(
        height: 205,
        width: 140,
      ),
    );
  }
}
