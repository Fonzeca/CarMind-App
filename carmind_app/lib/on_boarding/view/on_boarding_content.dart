import 'package:auto_size_text/auto_size_text.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:carmind_app/formularios/view/util/card_formulario.dart';
import 'package:carmind_app/home/view/navigation_bar.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:carmind_app/on_boarding/view/m_tool_tip.dart';
import 'package:carmind_app/vehiculo/view/card_vehiculo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingContent extends StatelessWidget {
  final TooltipController _controller = TooltipController();
  final PageController _pageController = PageController();
  bool done = false;

  ValueNotifier<bool> openDial = ValueNotifier(false);

  Widget? screen0;
  Widget? screen1;

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    screen0 = _buildScreen0();
    screen1 = _buildScreen1();
    this.context = context;
    _controller.onDone(
      () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CarMindNavigationBar()));
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("on_boarding_finish", true);
      },
    );
    return BlocProvider(
      create: (context) => OnBoardingBloc(),
      child: Stack(
        children: [
          OverlayTooltipScaffold(
            overlayColor: const Color(0xFF292929).withOpacity(0.8),
            controller: _controller,
            startWhen: (instantiatedWidgetLength) async {
              //await any function and return a bool value when done.
              await Future.delayed(const Duration(milliseconds: 500));
              return instantiatedWidgetLength == 2 && !done;
            },
            builder: (context) => pageView(),
          ),
          BlocBuilder<OnBoardingBloc, OnBoardingState>(
            builder: (context, state) {
              if (state.currentIndex != 1) {
                return Container();
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 389,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _controller.next();
                              BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingNextStep());
                            },
                            child: Container(height: 130, color: Colors.transparent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget pageView() {
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        _pageController.animateToPage(state.currentIndex == 2 ? 0 : state.currentIndex,
            duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
        if (state.currentIndex == 1) {
          openDial.value = false;
        } else {
          openDial.value = true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: _buildFooter(0),
        floatingActionButton: BlocBuilder<OnBoardingBloc, OnBoardingState>(
          builder: (context, state) {
            return _buildFAB(state.currentIndex != 1, qr: state.currentIndex == 0);
          },
        ),
        body: PageView(
          allowImplicitScrolling: true,
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: [
            screen0!,
            screen1!,
          ],
        ),
      ),
    );
  }

  Widget _buildScreen0() {
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
          BlocBuilder<OnBoardingBloc, OnBoardingState>(
            builder: (context, state) {
              if (state.currentIndex == 2) {
                return Row(
                  children: [
                    CardFormulario(
                        log: LogEvaluacion()
                          ..fecha = "09/03/2022 09:47"
                          ..nombre_evaluacion = "Chequeo de ingreso",
                        loading: false),
                  ],
                );
              }
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
            },
          ),
        ],
      ),
    );
  }

  Widget _buildScreen1() {
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
            vehiculo: Vehiculo()
              ..en_uso = true
              ..nombre = "Vehículo 1",
            loading: false,
          ),
          const SizedBox(height: 44),
          const SizedBox(
            height: 34,
            child: Text(
              "Formularios",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          SingleChildScrollView(
            child: OverlayTooltipItem(
              displayIndex: 1,
              tooltip: (p0) => Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MTooltip(controller: p0, title: "Completá los formularios que aparezcan en pantalla."),
                  const SizedBox(height: 20),
                  SvgPicture.asset("assets/arrow_onboarding.svg"),
                  const SizedBox(height: 20),
                ],
              ),
              tooltipVerticalPosition: TooltipVerticalPosition.TOP,
              tooltipHorizontalPosition: TooltipHorizontalPosition.CENTER,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.next();
                      BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingNextStep());
                    },
                    child: cardCheckList(0, "Chequedo de ingreso", 0),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      _controller.next();
                      BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingNextStep());
                    },
                    child: cardCheckList(0, "Chequedo de finalizacion", 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardCheckList(int id, String nombreCheck, int vencmimento) {
    bool tick = vencmimento > 0;
    return Card(
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
    );
  }

  Widget _buildFAB(bool open, {required bool qr}) {
    return OverlayTooltipItem(
      displayIndex: 0,
      tooltip: (p0) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MTooltip(controller: p0, title: "Escaneá el QR del vehículo que vas a utilizar."),
          const SizedBox(height: 100),
          SvgPicture.asset("assets/arrow_onboarding.svg"),
          const SizedBox(height: 80),
        ],
      ),
      tooltipVerticalPosition: TooltipVerticalPosition.TOP,
      tooltipHorizontalPosition: TooltipHorizontalPosition.CENTER,
      child: OverlayTooltipItem(
        displayIndex: 2,
        tooltip: (p0) => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MTooltip(controller: p0, title: "Avisa cuando termines de usar el vehiculo."),
            const SizedBox(height: 40),
            SvgPicture.asset("assets/arrow_onboarding.svg"),
            const SizedBox(height: 150),
          ],
        ),
        tooltipVerticalPosition: TooltipVerticalPosition.TOP,
        tooltipHorizontalPosition: TooltipHorizontalPosition.CENTER,
        child: Builder(builder: (context) {
          if (!qr) {
            return SpeedDial(
              openCloseDial: openDial,
              icon: Icons.qr_code_2,
              activeIcon: Icons.close,
              isOpenOnStart: open,
              direction: SpeedDialDirection.up,
              visible: true,
              backgroundColor: carMindPrimaryButton,
              foregroundColor: carMindGrey,
              iconTheme: const IconThemeData(size: 32),
              childMargin: const EdgeInsets.all(29),
              childPadding: const EdgeInsets.all(0),
              buttonSize: const Size(49, 49),
              childrenButtonSize: const Size(49, 49),
              spaceBetweenChildren: 19,
              renderOverlay: false,
              closeManually: true,
              onPress: () {
                _controller.next();
                BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingNextStep());
              },
              children: [
                SpeedDialChild(
                  child: const Icon(
                    Icons.qr_code_2,
                    size: 24,
                  ),
                  backgroundColor: carMindGrey,
                  foregroundColor: carMindPrimaryButton,
                  labelWidget: speedDialChild_labelwidget("Escanear código QR", 0),
                  onTap: () {
                    _controller.next();
                    BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingNextStep());
                  },
                ),
                SpeedDialChild(
                  child: SvgPicture.asset(
                    "assets/logout_vehicle.svg",
                    width: 18,
                    height: 18,
                  ),
                  backgroundColor: carMindGrey,
                  foregroundColor: carMindPrimaryButton,
                  labelWidget: speedDialChild_labelwidget("Dejar de usar vehículo", 1),
                  onTap: () {
                    _controller.next();
                    BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingNextStep());
                  },
                )
              ],
            );
          }
          return SpeedDial(
            openCloseDial: openDial,
            icon: Icons.qr_code_2,
            activeIcon: Icons.close,
            isOpenOnStart: open,
            direction: SpeedDialDirection.up,
            visible: true,
            backgroundColor: carMindPrimaryButton,
            foregroundColor: carMindGrey,
            iconTheme: const IconThemeData(size: 32),
            childMargin: const EdgeInsets.all(29),
            childPadding: const EdgeInsets.all(0),
            buttonSize: const Size(49, 49),
            childrenButtonSize: const Size(49, 49),
            spaceBetweenChildren: 19,
            renderOverlay: false,
            closeManually: true,
            onPress: () {
              _controller.next();
              BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingNextStep());
            },
            children: [
              SpeedDialChild(
                child: const Icon(
                  Icons.qr_code_2,
                  size: 24,
                ),
                backgroundColor: carMindGrey,
                foregroundColor: carMindPrimaryButton,
                labelWidget: speedDialChild_labelwidget("Escanear código QR", 0),
                onTap: () {
                  _controller.next();
                  BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingNextStep());
                },
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _buildFooter(int select) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/formulario.svg", color: Colors.white)),
            activeIcon:
                Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/formulario.svg", color: carMindAccentColor)),
            label: "Formularios"),
        BottomNavigationBarItem(
            icon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/vehiculo.svg", color: Colors.white)),
            activeIcon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/vehiculo.svg", color: carMindAccentColor)),
            label: "Vehículos"),
        BottomNavigationBarItem(
            icon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/profile.svg", color: Colors.white)),
            activeIcon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/profile.svg", color: carMindAccentColor)),
            label: "Perfil")
      ],
      currentIndex: select,
      selectedItemColor: carMindAccentColor,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      selectedFontSize: 14,
      unselectedFontSize: 14,
    );
  }

  //--------------
  Widget speedDialChild_labelwidget(String label, int indexPosition) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        margin: const EdgeInsets.only(right: 8),
        decoration: const BoxDecoration(
          color: carMindGrey,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

extension on Color {
  Color operator +(Color other) => Color.alphaBlend(other, this);
}
