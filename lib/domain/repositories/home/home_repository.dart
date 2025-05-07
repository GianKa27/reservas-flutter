import 'package:reservations_flutter/data/dataSource/home/home_data_source.dart';
import 'package:reservations_flutter/domain/entities/home/reservaions_entity.dart';
import 'package:reservations_flutter/domain/forms/home/create_reservation_form.dart';

abstract class HomeRepository {
  Future<ReservationsEntity> getReservations(
      int? userId, int? spaceId, DateTime? startDate, DateTime? endDate);
  Future<void> createReservation(CreateReservationForm form);
  Future<void> cancelReservation(int reservationId);
}

class HomeRepositoryImp implements HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoryImp(this._homeDataSource);

  @override
  Future<ReservationsEntity> getReservations(
      int? userId, int? spaceId, DateTime? startDate, DateTime? endDate) async {
    try {
      final response = await _homeDataSource.getReservations(
          userId, spaceId, startDate, endDate);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createReservation(CreateReservationForm form) async {
    try {
      await _homeDataSource.createReservation(form);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> cancelReservation(int reservationId) async {
    try {
      await _homeDataSource.cancelReservation(reservationId);
    } catch (e) {
      rethrow;
    }
  }
}
