part of 'formulario_bloc.dart';

abstract class FormularioEvent extends Equatable {
  const FormularioEvent();

  @override
  List<Object> get props => [];
}

class GetLastFormLogs extends FormularioEvent {
  final bool forceWaiting;
  final BuildContext context;

  const GetLastFormLogs(this.context, {this.forceWaiting = false});
}
