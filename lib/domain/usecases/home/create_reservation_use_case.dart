import 'package:reservations_flutter/domain/forms/home/create_reservation_form.dart';
import 'package:reservations_flutter/domain/repositories/home/home_repository.dart';

class CreateReservationUseCase {
  final HomeRepository _homeRepository;

  CreateReservationUseCase(this._homeRepository);

  Future<void> call(CreateReservationForm form) async {
    try {
      await _homeRepository.createReservation(form);
    } catch (e) {
      rethrow;
    }
  }
}
