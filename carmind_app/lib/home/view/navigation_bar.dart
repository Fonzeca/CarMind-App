import 'package:carmind_app/api/api.dart';
import 'package:carmind_app/formularios/formularios.dart';
import 'package:carmind_app/home/home.dart';
import 'package:carmind_app/home/view/offline_sign.dart';
import 'package:carmind_app/login/login.dart';
import 'package:carmind_app/profile/profile.dart';
import 'package:carmind_app/rutas/rutas.dart';
import 'package:carmind_app/vehiculo/vehiculo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../constants.dart';
import '../../services/version_service.dart';

class CarMindNavigationBar extends StatelessWidget {
  CarMindNavigationBar({Key? key}) : super(key: key);

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  int selectedIndex = 0;

  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      VersionService.isNewVersionAvailable().then((isNewVersion) {
        if (isNewVersion) VersionService.showVersionAvailableAlert(context);
      });
    });

    final VehiculoBloc vehiculoBloc = BlocProvider.of<VehiculoBloc>(context);
    final FormularioBloc formularioBloc = BlocProvider.of<FormularioBloc>(context);
    final RoutesBloc routesBloc = BlocProvider.of<RoutesBloc>(context);

    formularioBloc.add(const FormularioBuscarDataEvent());
    vehiculoBloc.add(GetCurrent(context));
    routesBloc.add(GetAllVehicles());

    this.context = context;
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLogoutState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }

        if (vehiculoBloc.needToUpdate) {
          vehiculoBloc.needToUpdate = false;
          vehiculoBloc.add(GetCurrent(context, forceWaiting: true));
        }

        if (formularioBloc.needToUpdate) {
          formularioBloc.needToUpdate = false;
          formularioBloc.add(const FormularioBuscarDataEvent(forceWaiting: true));
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          BlocProvider.of<HomeBloc>(context).add(const PopEvent());
          return false;
        },
        child: Scaffold(
            bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final ProfileBloc profileBloc = BlocProvider.of<ProfileBloc>(context);
                final List<BottomNavigationBarItem> navButtons = _buildButtonsOfNavigationBar(profileBloc);

                return BottomNavigationBar(
                  items: navButtons,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state.selectedNavButton,
                  selectedItemColor: carMindAccentColor,
                  unselectedItemColor: Colors.white,
                  backgroundColor: Colors.black,
                  selectedFontSize: 14,
                  unselectedFontSize: 14,
                  onTap: (value) {
                    switch (value) {
                      case 0:
                        formularioBloc.add(const FormularioBuscarDataEvent());
                        break;
                      case 1:
                        vehiculoBloc.add(GetCurrent(context));
                        break;
                    }
                    BlocProvider.of<HomeBloc>(context)
                      ..add(HomeNavigationEvent(value))
                      ..add(ShowFab());
                  },
                );
              },
            ),
            body: OfflineSign(
              service: GetIt.I.get<FlutterBackgroundService>(),
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) {
                  return (current is! HomeLogoutState) &&
                      (previous.selectedNavButton != current.selectedNavButton ||
                          previous.selectedPageView != current.selectedPageView ||
                          previous.evaluacion != current.evaluacion ||
                          previous.vehiculo != current.vehiculo);
                },
                builder: (context, state) {
                  switch (state.selectedPageView) {
                    case 0:
                      return const FormularioContent();
                    case 1:
                      return VehiculoEspecifico();
                    case 2:
                      return ProfileContent();
                    case 3:
                      return MapView();
                    case 4:
                      return FormularioPreguntas(
                        evaluacion: state.evaluacion ?? Evaluacion(),
                        vehiculo: state.vehiculo ?? Vehiculo(),
                      );
                  }
                  return Container();
                },
              ),
            ),
            floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  (previous.showFab != current.showFab) || (previous.showDejarDeUsarVehiculo != current.showDejarDeUsarVehiculo),
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
                    if (state.showDejarDeUsarVehiculo)
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
      ),
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
    String barcodeScanResponse = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", false, ScanMode.QR);
    BlocProvider.of<QrScannerBloc>(context!).add(QrEscaneoEvent(barcodeScanResponse, context!));
  }

  onTapLogoutVehicle() async {
    Navigator.push(context!, MaterialPageRoute(builder: (context) => const CheckAnimation(texto: "Has dejado de usar el vehículo")));
    BlocProvider.of<VehiculoBloc>(context!).add(DejarUsar(context!));
  }

  List<BottomNavigationBarItem> _buildButtonsOfNavigationBar(ProfileBloc profileBloc) {
    final List<BottomNavigationBarItem> buttons = [
      BottomNavigationBarItem(
          icon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/formulario.svg", color: Colors.white)),
          activeIcon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/formulario.svg", color: carMindAccentColor)),
          label: "Formularios"),
      BottomNavigationBarItem(
          icon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/vehiculo.svg", color: Colors.white)),
          activeIcon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/vehiculo.svg", color: carMindAccentColor)),
          label: "Vehículos"),
      BottomNavigationBarItem(
          icon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/profile.svg", color: Colors.white)),
          activeIcon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/profile.svg", color: carMindAccentColor)),
          label: "Perfil")
    ];

    if (profileBloc.state.logged != null && profileBloc.state.logged!.administrador!) {
      buttons.add(BottomNavigationBarItem(
          icon: Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/routes_nav_icon.svg", color: Colors.white)),
          activeIcon:
              Padding(padding: const EdgeInsets.only(bottom: 3), child: SvgPicture.asset("assets/routes_nav_icon.svg", color: carMindAccentColor)),
          label: "Rutas"));
    }

    return buttons;
  }
}
