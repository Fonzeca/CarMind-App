import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../constants.dart';
import 'package:carmind_app/api/api.dart';



class CardFormulario extends StatelessWidget {
  final LogEvaluacion? log;
  final bool loading;

  const CardFormulario({Key? key, required this.log, required this.loading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) return loadingCard();
    return SizedBox(
      height: 205,
      width: 140,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.zero,
        color: const Color(0xFFE4E4E4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)), color: carMindTopBar),
              width: double.infinity,
              height: 139,
              child: Center(
                child: SizedBox(
                  width: 54,
                  height: 54,
                  child: SvgPicture.asset(
                    "assets/formulario.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 25),
                        child: AutoSizeText(
                          "${log!.nombre_evaluacion}",
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 25),
                        child: AutoSizeText(
                          "Fecha: ${_readableDate()}",
                          maxFontSize: 11,
                          minFontSize: 3,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
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

  String _readableDate() {
    var dateTimeForm = DateFormat(dateTimeFormat);
    var dateForm = DateFormat(dateFormat);
    DateTime logDate = dateTimeForm.parse(log!.fecha!);
    String todayDate = dateForm.format(DateTime.now());
    String yesterdayDate = dateForm.format(DateTime.now().subtract(const Duration(days: 1)));
    String logDateString = dateForm.format(logDate);
    int isToday = logDateString.compareTo(todayDate);
    int isYesterday = logDateString.compareTo(yesterdayDate);
    if (isToday == 0) return 'Hoy ${logDate.hour}:${logDate.minute}';
    if (isYesterday == 0) return 'Ayer ${logDate.hour}:${logDate.minute}';
    return log!.fecha!;
  }
}
