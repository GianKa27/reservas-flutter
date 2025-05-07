import 'package:dio/dio.dart';
import 'package:reservations_flutter/core/errors/general_exception.dart';
import 'package:reservations_flutter/core/http/http_client.dart';
import 'package:reservations_flutter/core/utils/utils.dart';
import 'package:reservations_flutter/data/models/home/reservations_model.dart';
import 'package:reservations_flutter/domain/forms/home/create_reservation_form.dart';

abstract class HomeDataSource {
  Future<ReservationsModel> getReservations(
      int? userId, int? spaceId, DateTime? startDate, DateTime? endDate);
  Future<void> createReservation(CreateReservationForm form);
  Future<void> cancelReservation(int reservationId);
}

class HomeDataSourceImp extends HttpClient implements HomeDataSource {
  @override
  Future<ReservationsModel> getReservations(
      int? userId, int? spaceId, DateTime? startDate, DateTime? endDate) async {
    try {
      final response = await dio.get('/', queryParameters: {
        "userId": userId,
        "spaceId": spaceId,
        "startDate": startDate,
        "endDate": endDate
      });

      return ReservationsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Utils.errorCatch(e);
    } catch (e) {
      throw GeneralException();
    }
  }

  @override
  Future<void> createReservation(CreateReservationForm form) async {
    try {
      await dio.post('/', data: form.toMap);
    } on DioException catch (e) {
      throw Utils.errorCatch(e);
    } catch (e) {
      throw GeneralException();
    }
  }

  @override
  Future<void> cancelReservation(int reservationId) async {
    try {
      await dio.delete('/$reservationId');
    } on DioException catch (e) {
      throw Utils.errorCatch(e);
    } catch (e) {
      throw GeneralException();
    }
  }
}
