import 'package:flutter_test/flutter_test.dart';

import 'package:carmind_app/vehiculo/vehiculo.dart';

class VehicleRobot {
  const VehicleRobot(this.tester);
  final WidgetTester tester;

  Future<void> findVehicleTitle() async {
    expect(find.text("Estas conduciendo:"), findsOneWidget);
  }

  Future<void> checkIfIsDrivingVehicle() async {
    await tester.pumpAndSettle();
    final vehicleWidget = tester.widget(find.byType(VehiculoEspecifico)) as VehiculoEspecifico;

    if (vehicleWidget.vehiculo != null) {
      findFormTitle();
    } else {
      findNoVehicleTitle();
    }

    await tester.pumpAndSettle();
  }

  Future<void> findFormTitle() async {
    expect(find.text("Elegí un formulario:"), findsOneWidget);
  }

  Future<void> findNoVehicleTitle() async {
    expect(find.text("No estas conduciendo ningún vehículo"), findsOneWidget);
  }
}
