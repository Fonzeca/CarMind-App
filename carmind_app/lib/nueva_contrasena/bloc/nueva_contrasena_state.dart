
part of 'nueva_contrasena_bloc.dart';


class NuevaContrasenaState extends Equatable {

  final String email;
  final String codigo;
  final String newPass;
  final bool arePassEquals;
  final bool inputChangedValue;
  final double timeLeft;

  const NuevaContrasenaState(this.email, this.codigo, this.newPass, this.arePassEquals, this.inputChangedValue, this.timeLeft);


  
  NuevaContrasenaState copyWith({String? email,String? codigo,String? newPass,bool? arePassEquals, bool? inputChangedValue, double? timeLeft}) {
    return NuevaContrasenaState(
      email ?? this.email,
      codigo ?? this.codigo,
      newPass ?? this.newPass,
      arePassEquals ?? this.arePassEquals,
      inputChangedValue ?? this.inputChangedValue,
      timeLeft ?? this.timeLeft,
    );
  }

  @override
  List<Object> get props => [email, codigo, newPass, arePassEquals, inputChangedValue, timeLeft];
}

class NuevaConstrasenaInitial extends NuevaContrasenaState {
  const NuevaConstrasenaInitial() : super('','','',true, false, -2);
}