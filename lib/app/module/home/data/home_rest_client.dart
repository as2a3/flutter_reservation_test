import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'home_rest_client.g.dart';

/// HomeRestClient: Api connection rest client
@RestApi(baseUrl: 'https://www.kaptanvip.com/dev/api/')
abstract class HomeRestClient {
  /// Constructor
  factory HomeRestClient(Dio dio, {String baseUrl}) = _HomeRestClient;

  /// getBookings: get bookings from api
  @GET('bookings')
  Future<dynamic> getBookings();
}
