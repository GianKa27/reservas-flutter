import 'package:reservations_flutter/domain/entities/home/reservaions_entity.dart';
import 'package:reservations_flutter/domain/repositories/home/home_repository.dart';

class GetReservationsUseCase {
  final HomeRepository _homeRepository;

  GetReservationsUseCase(this._homeRepository);

  Future<ReservationsEntity> call(
      int? userId, int? spaceId, DateTime? startDate, DateTime? endDate) async {
    try {
      final response = await _homeRepository.getReservations(
          userId, spaceId, startDate, endDate);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
