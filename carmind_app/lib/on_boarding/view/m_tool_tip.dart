import 'package:auto_size_text/auto_size_text.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';

class MTooltip extends StatelessWidget {
  final TooltipController controller;
  final String title;

  const MTooltip({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentDisplayIndex = controller.nextPlayIndex + 1;
    final totalLength = controller.playWidgetLength;
    return Container(
      width: size.width * .7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                controller.dismiss();
                BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingCancel());
              },
              child: const Icon(Icons.close, color: Color(0xFF888888), size: 25),
            ),
          ),
          const SizedBox(height: 23),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 100, maxWidth: 215),
            child: AutoSizeText(
              title,
              textAlign: TextAlign.center,
              maxLines: 4,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              controller.next();
              BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingNextStep());
            },
            style: TextButton.styleFrom(
              backgroundColor: currentDisplayIndex == totalLength ? carMindAccentColor : carMindTopBar,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 2,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                currentDisplayIndex == totalLength ? 'Entendido' : 'Siguiente',
                style: TextStyle(
                  color: currentDisplayIndex == totalLength ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
