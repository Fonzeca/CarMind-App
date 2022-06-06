import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion_terminada.dart';
import 'package:carmind_app/formularios/bloc/realizar_evaluacion_bloc.dart';
import 'package:carmind_app/formularios/view/tipo_preguntas/pregunta_base.dart';
import 'package:carmind_app/formularios/view/util/pregunta_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreguntaKM extends StatelessWidget with PreguntaInterface {
  final PreguntaPojo pregunta;
  final TextEditingController controller = TextEditingController();
  ValueNotifier<bool> reconstruye = ValueNotifier(false);

  PreguntaKM({Key? key, required this.pregunta}) : super(key: key);

  bool? preguntaEnabled;

  bool preguntaFinalizada = false;

  Color errorColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealizarEvaluacionBloc, RealizarEvaluacionState>(
      builder: (context, state) {
        preguntaEnabled = state.preguntaActual == pregunta.id || state.preguntasRespondidas.contains(pregunta.id);
        return PreguntaBase(
          preguntaEnabled: preguntaEnabled!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    pregunta.descripcion!,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: TextField(

                      minLines: null,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.top,
                      controller: controller,
                      enabled: preguntaEnabled!,
                      onChanged: (value) {
                        preguntaFinalizada = false;
                        reconstruye.value = !reconstruye.value;
                         BlocProvider.of<RealizarEvaluacionBloc>(context).add(ValidarTextFieldEvent(_isFieldEmptyError(), _isFieldNotNumberError()));
                      },
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration:   InputDecoration(
                        border:  const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBDAAFF))),
                        focusedBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBDAAFF))),
                        contentPadding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        hintText: "Añadir kilometraje...",
                        errorText: (state.isFieldEmptyError || state.isFieldNotNumberError) ? _errorTextToShow() : null,
                        errorStyle: TextStyle(color: errorColor),
                        errorBorder: _renderBorder(state),
                        enabledBorder: _renderBorder(state),
                        focusedErrorBorder: _renderBorder(state)
                      ),
                      
                    ),
                    
                  ),
                  const SizedBox(height: 20 - 12),
                  ValueListenableBuilder(
                    valueListenable: reconstruye,
                    builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: preguntaEnabled! && !state.isFieldEmptyError && !state.isFieldNotNumberError
                                ? () {
                                    preguntaFinalizada = true;
                                    reconstruye.value = !reconstruye.value;
                                  }
                                : null,
                            icon: SvgPicture.asset(
                              preguntaFinalizada ? "assets/tick_fill.svg" : "assets/tick_empty.svg",
                              color: preguntaEnabled! && !state.isFieldNotNumberError ? null : const Color(0xFF6F6F6F),
                            ),
                            padding: EdgeInsets.zero,
                            iconSize: 23,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16 - 12)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  RespuestaPojo setearRespuesta() {
    RespuestaPojo res = RespuestaPojo();
    res.pregunta_id = pregunta.id;
    res.texto = controller.text;
    return res;
  }


  UnderlineInputBorder _renderBorder(RealizarEvaluacionState state) =>
      UnderlineInputBorder(
        borderSide: BorderSide(
            color: (state.isFieldEmptyError || state.isFieldNotNumberError) ? errorColor : Colors.black,
            width: 1),
      );


  String _errorTextToShow(){

    if( _isFieldEmptyError()){
      errorColor = const Color(0xFF6F6F6F);
      return "Este campo no puede estar vacío";
    } 

    if(_isFieldNotNumberError()){
      errorColor = Colors.red;
      return  "Debes ingresar un número válido";
    } 

    return "";
  }

  bool _isFieldEmptyError(){
    return controller.text.isEmpty;
  }

  bool _isFieldNotNumberError(){
    return int.tryParse(controller.text) == null;
  }

}
