
part of 'nueva_contrasena_bloc.dart';


class NuevaContrasenaState extends Equatable {

  final String email;
  final String codigo;
  final String newPass;
  final bool arePassEquals;
  final bool inputChangedValue;

  const NuevaContrasenaState(this.email, this.codigo, this.newPass, this.arePassEquals, this.inputChangedValue);


  
  NuevaContrasenaState copyWith({String? email,String? codigo,String? newPass,bool? arePassEquals, bool? inputChangedValue}) {
    return NuevaContrasenaState(
      email ?? this.email,
      codigo ?? this.codigo,
      newPass ?? this.newPass,
      arePassEquals ?? this.arePassEquals,
      inputChangedValue ?? this.inputChangedValue
    );
  }

  @override
  List<Object> get props => [email, codigo, newPass, arePassEquals];
}

class NuevaConstrasenaInitial extends NuevaContrasenaState {
  const NuevaConstrasenaInitial() : super('','','',true, false);
}