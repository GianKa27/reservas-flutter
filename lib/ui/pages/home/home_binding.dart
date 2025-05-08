import 'package:get/get.dart';
import 'package:reservations_flutter/data/dataSource/home/home_data_source.dart';
import 'package:reservations_flutter/domain/repositories/home/home_repository.dart';
import 'package:reservations_flutter/domain/usecases/home/cancel_reservation_use_case.dart';
import 'package:reservations_flutter/domain/usecases/home/create_reservation_use_case.dart';
import 'package:reservations_flutter/domain/usecases/home/get_reservations_use_case.dart';
import 'package:reservations_flutter/domain/usecases/home/get_spaces_use_case.dart';
import 'package:reservations_flutter/domain/usecases/home/get_users_use_case.dart';
import 'package:reservations_flutter/ui/pages/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeDataSource>(HomeDataSourceImp(), permanent: true);
    Get.put<HomeRepository>(HomeRepositoryImp(Get.find()));

    Get.create(() => GetUsersUseCase(Get.find()));
    Get.create(() => GetSpacesUseCase(Get.find()));
    Get.create(() => GetReservationsUseCase(Get.find()));
    Get.create(() => CancelReservationUseCase(Get.find()));
    Get.create(() => CreateReservationUseCase(Get.find()));

    Get.lazyPut(
        () => HomeController(
              Get.find(),
              Get.find(),
              Get.find(),
              Get.find(),
              Get.find(),
            ),
        fenix: true);
  }
}
