import 'package:booking/app/module/home/data/home_api_repository.dart';
import 'package:booking/app/module/home/model/booking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// RootController: The controller of main view
class RootController extends GetxController {
  /// Constructor
  RootController() {
    _repository = Get.find<HomeApiRepository>();
  }

  late final HomeApiRepository _repository;

  /// bookings: Bookings list
  final bookings = <Booking>[].obs;

  /// isDarkMode: Is Dark Mode?
  final isDarkMode = false.obs;

  /// loading: Is getting Data?
  final loading = false.obs;

  /// loadingError: If error exist while getting data
  final loadingError = false.obs;

  /// loadingErrorMessage: The error message If error exist
  final loadingErrorMessage = ''.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  /// getData: Get View page data
  Future<void> getData() async {
    await _getBookings();
  }

  /// changeSystemMode
  void changeSystemMode() {
    if (isDarkMode.isTrue) {
      isDarkMode.value = false;
      Get.changeThemeMode(ThemeMode.light);
    } else {
      isDarkMode.value = true;
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  /// --------------------------------- API ------------------------------------
  /// Get bookings from API
  Future<void> _getBookings() async {
    loading.value = true;
    loadingError.value = false;
    final response = await _repository.getBookings();
    loading.value = false;
    response.fold(
      (l) {
        loadingError.value = true;
        loadingErrorMessage.value = l;
      },
      bookings.assignAll,
    );
  }
}
