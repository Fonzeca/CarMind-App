import 'package:carmind_app/api/pojo/evaluacion/evaluacion.dart';
import 'package:carmind_app/api/pojo/evaluacion/evaluacion_terminada.dart';
import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion.dart';
import 'package:carmind_app/api/pojo/login_pojo.dart';
import 'package:carmind_app/api/pojo/profile/logged_user.dart';
import 'package:carmind_app/api/pojo/profile/offline_data.dart';
import 'package:carmind_app/api/pojo/profile/sync_view.dart';
import 'package:carmind_app/api/pojo/vehiculo/vehiculo.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://66.97.44.3:2233/") // DEV
// @RestApi(baseUrl: "https://66.97.43.111:2233/") //PRO
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/login")
  Future<TokenLogin> login(@Query("username") String email, @Query("password") String password);

  @GET("/loggedUser")
  Future<LoggedUser> loggedUser();

  @GET("/validate")
  Future<HttpResponse<void>> valdiateToken();

  @GET("/usuario/modo-offline")
  Future<OfflineData> obtenerDatosOffline();

  @POST("/usuario/sync")
  Future<void> sincronizarDatos(@Body() SyncView sync);

  //----------------------------EVALUACION----------------------------

  @GET("/evaluacion/{id}")
  Future<Evaluacion> getEvaluacionById(@Path("id") int idEvaluacion);

  @POST("/evaluacion/{id}/realizar")
  Future<void> realizarEvaluacion(@Path("id") int idEvaluacion, @Body() EvaluacionTerminadaPojo pojo);

  @GET("/evaluacion/historial/loggedUser")
  Future<List<LogEvaluacion>> getLogEvaluacionesByLoggedUser();

  //----------------------------VEHICULO----------------------------

  @GET("/vehiculo/{id}")
  Future<Vehiculo> getVehiculoById(@Path("id") int idVehiculo);

  @GET("/vehiculo/{id}/iniciarUso")
  Future<void> iniciarUso(@Path("id") int idVehiculo);

  @GET("/vehiculo/{id}/terminarUso")
  Future<void> terminarUso(@Path("id") int idVehiculo);

  @GET("/vehiculo/current")
  Future<Vehiculo?> getCurrent();
}
