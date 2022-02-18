import 'package:carmind_app/api/pojo/login_pojo.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://vps-1791261-x.dattaweb.com:2233/")
abstract class ApiClient{
  factory ApiClient (Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/login")
  Future<TokenLogin> login(@Query("username") String email, @Query("password") String password);
}