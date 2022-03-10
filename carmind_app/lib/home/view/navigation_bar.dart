import 'package:carmind_app/formularios/view/content_main.dart';
import 'package:carmind_app/formularios/view/formulario.dart';
import 'package:carmind_app/formularios/view/util/check_animation.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/login/view/login_screen.dart';
import 'package:carmind_app/main.dart';
import 'package:carmind_app/profile/view/profile_content.dart';
import 'package:carmind_app/vehiculo/bloc/vehiculo_bloc.dart';
import 'package:carmind_app/vehiculo/view/qr_scanner.dart';
import 'package:carmind_app/vehiculo/view/vehiculo_especifico.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';

class CarMindNavigationBar extends StatelessWidget {
  CarMindNavigationBar({Key? key}) : super(key: key);

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  int selectedIndex = 0;

  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLogoutState) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
        }
      },
      child: Scaffold(
          bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/formulario.svg", color: Colors.white)),
                      activeIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/formulario.svg", color: carMindAccentColor)),
                      label: "Formularios"),
                  BottomNavigationBarItem(
                      icon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/vehiculo.svg", color: Colors.white)),
                      activeIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/vehiculo.svg", color: carMindAccentColor)),
                      label: "Vehículos"),
                  BottomNavigationBarItem(
                      icon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/profile.svg", color: Colors.white)),
                      activeIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/profile.svg", color: carMindAccentColor)),
                      label: "Perfil")
                ],
                currentIndex: state.selectedNavButton,
                selectedItemColor: carMindAccentColor,
                unselectedItemColor: Colors.white,
                backgroundColor: Colors.black,
                selectedFontSize: 14,
                unselectedFontSize: 14,
                onTap: (value) {
                  BlocProvider.of<HomeBloc>(context).add(HomeNavigationEvent(value));
                },
              );
            },
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) {
              return current is! HomeLogoutState;
            },
            builder: (context, state) {
              switch (state.selectedPageView) {
                case 0:
                  return FormuarioContent(context);
                case 1:
                  return VehiculoEspecifico();
                case 2:
                  return ProfileContent();
                case 3:
                  return Container();
                case 4:
                  return FormularioPreguntas(evalua: state.data);
              }
              return Container();
            },
          ),
          floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) => previous.showFab != current.showFab,
            builder: (context, state) {
              return SpeedDial(
                openCloseDial: isDialOpen,
                icon: Icons.qr_code_2,
                activeIcon: Icons.close,
                direction: SpeedDialDirection.up,
                onPress: () {
                  isDialOpen.value = true;
                },
                visible: state.showFab,
                overlayColor: const Color(0xA6292929),
                backgroundColor: carMindPrimaryButton,
                foregroundColor: carMindGrey,
                iconTheme: const IconThemeData(size: 32),
                childMargin: const EdgeInsets.all(29),
                childPadding: const EdgeInsets.all(0),
                buttonSize: const Size(49, 49),
                childrenButtonSize: const Size(49, 49),
                spaceBetweenChildren: 19,
                children: [
                  SpeedDialChild(
                    child: const Icon(
                      Icons.qr_code_2,
                      size: 24,
                    ),
                    backgroundColor: carMindGrey,
                    foregroundColor: carMindPrimaryButton,
                    labelWidget: speedDialChild_labelwidget("Escanear código QR", 0),
                    onTap: () => onTapDialChild(0),
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
                    onTap: () => onTapDialChild(1),
                  )
                ],
              );
            },
          )),
    );
  }

  Widget speedDialChild_labelwidget(String label, int indexPosition) {
    return GestureDetector(
      onTap: () => onTapDialChild(indexPosition, true),
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

  onTapDialChild(int indexPosition, [bool isLabel = false]) {
    switch (indexPosition) {
      case 0:
        onTapQr();
        break;
      case 1:
        onTapLogoutVehicle();
        break;
      default:
    }

    if (isLabel) {
      isDialOpen.value = !isDialOpen.value;
    }
  }

  onTapQr() async {
    Navigator.push(context!, MaterialPageRoute(builder: (context) => QrVehiculoScanner()));
  }

  onTapLogoutVehicle() async {
    Navigator.push(context!, MaterialPageRoute(builder: (context) => const ChechAnimation(texto: "Has dejado de usar el vehiculo")));
    BlocProvider.of<VehiculoBloc>(context!).add(DejarUsar());
  }
}
