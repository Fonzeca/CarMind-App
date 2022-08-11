import 'package:carmind_app/api/api.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import 'pojo/profile/sync_view.dart';

part 'api_client.g.dart';

//@RestApi(baseUrl: "http://localhost:8090/") // LOCAL
@RestApi(baseUrl: "http://66.97.44.3:2233/") // DEV
// @RestApi(baseUrl: "https://66.97.43.111:2233/") //PRO
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/login")
  Future<TokenLogin> login(@Query("username") String email, @Query("password") String password, @Query("FCMToken") String fcmToken);

  @GET("/loggedUser")
  Future<LoggedUser> loggedUser();

  @GET("/validate")
  Future<HttpResponse<void>> valdiateToken();

  @GET("/usuario/modo-offline")
  Future<OfflineData> obtenerDatosOffline();

  @POST("/usuario/sync")
  Future<void> sincronizarDatos(@Body() SyncView sync);

  @POST("/public/usuario/recuperar")
  Future<void> recuperarContrasena(@Query('email') String email);

  @POST("/public/usuario/validateRecoverToken")
  Future<void> validateRecoverToken(@Body() RecoverPasswordUserPojo pojo);

  @POST("/public/usuario/resetPassword")
  Future<void> resetPassword(@Body() RecoverPasswordUserPojo pojo);

  @POST("/usuario/newPassword")
  Future<void> newPasswordAtFirstLogin(@Query("password") String password);

  //----------------------------EVALUACION----------------------------

  @GET("/evaluacion/{id}")
  Future<Evaluacion> getEvaluacionById(@Path("id") int idEvaluacion);

  @POST("/evaluacion/{id}/realizar")
  Future<void> realizarEvaluacion(@Path("id") int idEvaluacion, @Body() EvaluacionTerminadaPojo pojo);

  @GET("/evaluacion/historial/loggedUser?limit={limit}")
  Future<List<LogEvaluacion>> getLogEvaluacionesByLoggedUser(@Path("limit") String limit);

  //----------------------------VEHICULO----------------------------

  @GET("/vehiculo/{id}")
  Future<Vehiculo> getVehiculoById(@Path("id") int idVehiculo);

  @GET("/vehiculo/{id}/iniciarUso")
  Future<void> iniciarUso(@Path("id") int idVehiculo);

  @GET("/vehiculo/{id}/terminarUso")
  Future<void> terminarUso(@Path("id") int idVehiculo);

  @GET("/vehiculo/current")
  Future<Vehiculo?> getCurrent();

  //----------------------------VERSION----------------------------
  @GET("/public/lastVersion_new?platform={platform}")
  Future<VersionView> getLastVersionByPlatform(@Path("platform") String storeType);
}
