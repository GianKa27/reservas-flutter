import 'package:reservations_flutter/core/errors/custom_exception.dart';

class CreateReservationForm {
  int? userId;
  int? spaceId;
  DateTime? startDate;
  DateTime? endDate;

  CreateReservationForm(
      {this.userId, this.spaceId, this.startDate, this.endDate});

  Map<String, dynamic> get toMap => {
        "userId": userId,
        "spaceId": spaceId,
        "startDate": startDate.toString(),
        "endDate": endDate.toString()
      };

  void validate() {
    if (userId == null) {
      throw CustomException("Field userId is required");
    }
    ;
    if (spaceId == null) {
      throw CustomException("Field spaceId is required");
    }
    ;
    if (startDate == null) {
      throw CustomException("Field startDate is required");
    }
    ;
    if (endDate == null) {
      throw CustomException("Field endDate is required");
    }
    ;
  }
}
