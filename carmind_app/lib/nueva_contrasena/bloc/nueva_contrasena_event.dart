part of 'nueva_contrasena_bloc.dart';

abstract class NuevaConstrasenaEvent extends Equatable {
  const NuevaConstrasenaEvent();

  @override
  List<Object> get props => [];
}

class RestaurarContrasenaEvent extends NuevaConstrasenaEvent{
   final String email;

  const RestaurarContrasenaEvent(this.email);
}

class StartCountEvent extends NuevaConstrasenaEvent{}

class IncrementCountEvent extends NuevaConstrasenaEvent{
  final double timeLeft;

  const IncrementCountEvent(this.timeLeft);
}

class VerificarCodigoEvent extends NuevaConstrasenaEvent{
  final String email;
  final String codigo;

  const VerificarCodigoEvent(this.email, this.codigo);
}

class CambiarContrasenaEvent extends NuevaConstrasenaEvent{
  final String email;
  final String codigo;
  final String newPass;

  const CambiarContrasenaEvent(this.email, this.codigo, this.newPass);
}

class NuevaContrasenaEnPrimerLoginEvent extends NuevaConstrasenaEvent{
  final String newPass;
  
  const NuevaContrasenaEnPrimerLoginEvent(this.newPass);
}

class InputValueChangedEvent extends NuevaConstrasenaEvent{}

class ArePassNotEqualsEvent extends NuevaConstrasenaEvent{}

class PopEvent extends NuevaConstrasenaEvent{}
