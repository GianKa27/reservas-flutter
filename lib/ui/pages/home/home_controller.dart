import 'package:get/get.dart';
import 'package:reservations_flutter/domain/entities/home/reservaions_entity.dart';
import 'package:reservations_flutter/domain/entities/home/spaces_entity.dart';
import 'package:reservations_flutter/domain/entities/home/users_entity.dart';
import 'package:reservations_flutter/domain/forms/home/create_reservation_form.dart';
import 'package:reservations_flutter/domain/usecases/home/cancel_reservation_use_case.dart';
import 'package:reservations_flutter/domain/usecases/home/create_reservation_use_case.dart';
import 'package:reservations_flutter/domain/usecases/home/get_reservations_use_case.dart';
import 'package:reservations_flutter/domain/usecases/home/get_spaces_use_case.dart';
import 'package:reservations_flutter/domain/usecases/home/get_users_use_case.dart';

class HomeController extends GetxController {
  final GetReservationsUseCase _getReservationsUseCase;
  final GetSpacesUseCase _getSpacesUseCase;
  final GetUsersUseCase _getUsersUseCase;
  final CancelReservationUseCase _cancelReservationUseCase;
  final CreateReservationUseCase _createReservationUseCase;

  HomeController(
      this._getReservationsUseCase,
      this._getSpacesUseCase,
      this._getUsersUseCase,
      this._cancelReservationUseCase,
      this._createReservationUseCase);

  DateTime? daySelected;

  List<UserEntity> users = [];
  List<SpaceEntity> spaces = [];
  List<ReservationEntity> reservations = [];

  int? userIdFilter;
  int? spaceIdFilter;
  DateTime? startDateFilter;
  DateTime? endDateFilter;

  Future<void> getReservations() async {
    try {
      final response = await _getReservationsUseCase.call(
          userIdFilter, spaceIdFilter, startDateFilter, endDateFilter);

      reservations = response.data;
    } catch (e) {
      rethrow;
    } finally {
      update(['bodyReservations']);
    }
  }

  Future<void> getUsers() async {
    try {
      final response = await _getUsersUseCase.call();

      users = response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getSpaces() async {
    try {
      final response = await _getSpacesUseCase.call();

      spaces = response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createReservation(CreateReservationForm form) async {
    try {
      form.validate();

      await _createReservationUseCase.call(form);

      await getReservations();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelReservation(int reservationId) async {
    try {
      await _cancelReservationUseCase.call(reservationId);

      await getReservations();
    } catch (e) {
      rethrow;
    }
  }
}
