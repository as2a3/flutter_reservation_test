import 'package:booking/app/module/home/data/home_rest_client.dart';
import 'package:booking/app/module/home/model/booking.dart';
import 'package:booking/app/network/dio_client.dart';
import 'package:booking/app/network/dio_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

/// HomeApiRepository
class HomeApiRepository extends GetxService {
  /// Constructor
  HomeApiRepository();

  /// _apiClient
  late HomeRestClient _apiClient;

  /// init
  Future<HomeApiRepository> init() async {
    _apiClient = HomeRestClient(
      DioClient().getDio,
    );
    return this;
  }

  /// getBookings
  Future<Either<String, List<Booking>>> getBookings() async {
    try {
      final response = await _apiClient.getBookings();
      return Right(
        (response as List)
            .map((e) => Booking.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } on DioException catch (e) {
      return Left(DioExceptions.fromDioError(e).message);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
