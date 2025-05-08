import 'package:reservations_flutter/domain/entities/home/reservaions_entity.dart';

import 'spaces_model.dart';
import 'users_model.dart';

class ReservationsModel extends ReservationsEntity {
  ReservationsModel({required List<ReservationModel> data}) : super(data: data);

  factory ReservationsModel.fromJson(Map<String, dynamic> json) =>
      ReservationsModel(
        data: List<ReservationModel>.from(
            json["data"].map((x) => ReservationModel.fromJson(x))),
      );
}

class ReservationModel extends ReservationEntity {
  ReservationModel({
    required super.id,
    required super.userId,
    required super.spaceId,
    required super.startDate,
    required super.endDate,
    required super.status,
    required UserModel super.user,
    required SpaceModel super.space,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      ReservationModel(
        id: json["id"],
        userId: json["userId"],
        spaceId: json["spaceId"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        status: json["status"],
        user: UserModel.fromJson(json["user"]),
        space: SpaceModel.fromJson(json["space"]),
      );
}
