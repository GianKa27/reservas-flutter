import 'package:reservations_flutter/domain/repositories/home/home_repository.dart';

class CancelReservationUseCase {
  final HomeRepository _homeRepository;

  CancelReservationUseCase(this._homeRepository);

  Future<void> call(int reservationId) async {
    try {
      await _homeRepository.cancelReservation(reservationId);
    } catch (e) {
      rethrow;
    }
  }
}
