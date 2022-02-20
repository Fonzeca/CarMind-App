import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreguntaTX extends StatelessWidget {
  final PreguntaPojo pregunta;
  final TextEditingController controller = TextEditingController();

  PreguntaTX({Key? key, required this.pregunta}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              pregunta.descripcion!,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 64,
              child: const TextField(
                minLines: null,
                maxLines: null,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                expands: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBDAAFF))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBDAAFF))),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    hintText: "Añadir nota..."),
              ),
            ),
            const SizedBox(height: 20 - 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/tick_empty.svg",),
                    padding: EdgeInsets.zero,
                    iconSize: 23,
                  ),
              ],
            ),
            const SizedBox(height: 16-12)
          ],
        ),
      ),
    );
  }
}
