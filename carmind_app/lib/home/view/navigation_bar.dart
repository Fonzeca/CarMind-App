
import 'package:carmind_app/formularios/view/content_main.dart';
import 'package:carmind_app/home/bloc/home_bloc.dart';
import 'package:carmind_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';

class CarMindNavigationBar extends StatelessWidget {
  CarMindNavigationBar({Key? key}) : super(key: key);

  final FormuarioContent formularios = FormuarioContent();

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    PageController controller = PageController(initialPage: selectedIndex);

    return Scaffold(
        bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/formulario.svg",
                          color: Colors.white),
                      activeIcon: SvgPicture.asset("assets/formulario.svg",
                          color: carMindAccentColor),
                      label: "Formularios"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/vehiculo.svg",
                          color: Colors.white),
                      activeIcon: SvgPicture.asset("assets/vehiculo.svg",
                          color: carMindAccentColor),
                      label: "Vehículos"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/profile.svg",
                          color: Colors.white),
                      activeIcon: SvgPicture.asset("assets/profile.svg",
                          color: carMindAccentColor),
                      label: "Perfil")
                ],
                currentIndex: state.selectedIndex,
                selectedItemColor: carMindAccentColor,
                unselectedItemColor: Colors.white,
                backgroundColor: Colors.black,

                onTap: (value) {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeNavigationEvent(value));
                  controller.jumpToPage(value);
                });
          },
        ),
        body: PageView(
          controller: controller,
          allowImplicitScrolling: false,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            formularios,
            Container(
              color: Colors.deepOrange,
            ),
            Container(
              color: Colors.greenAccent,
            )
          ],
        ),
        floatingActionButton: SpeedDial(
          openCloseDial: isDialOpen,
          icon: Icons.qr_code_2,
          activeIcon: Icons.close,
          direction: SpeedDialDirection.up,
          onPress: () {
            isDialOpen.value = true;
          },
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
              child: const Icon(Icons.qr_code_2, size: 24,),
              backgroundColor: carMindGrey,
              foregroundColor: carMindPrimaryButton,
              labelWidget: speedDialChild_labelwidget("Escanear código QR", 0),
              onTap: () => onTapDialChild(0), 
            ),
            SpeedDialChild(
              child: SvgPicture.asset("assets/logout_vehicle.svg", width: 18, height: 18,),
              backgroundColor: carMindGrey,
              foregroundColor: carMindPrimaryButton,
              labelWidget: speedDialChild_labelwidget("Dejar de usar vehículo", 1),
              onTap: () => onTapDialChild(1),
            )
          ],
        ));
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
        child: Text(label, style: const TextStyle(color: Colors.white),),
      ),
    );
  }

  onTapDialChild(int indexPosition, [bool isLabel = false]){



    if(isLabel){
     isDialOpen.value = !isDialOpen.value;
    }
  }

}
