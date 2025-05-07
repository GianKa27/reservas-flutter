import 'package:reservations_flutter/domain/entities/home/reservaions_entity.dart';

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
        startDate: json["startDate"],
        endDate: json["endDate"],
        status: json["status"],
        user: UserModel.fromJson(json["user"]),
        space: SpaceModel.fromJson(json["space"]),
      );
}

class SpaceModel extends SpaceEntity {
  SpaceModel({
    required super.id,
    required super.status,
    required super.nombre,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) => SpaceModel(
        id: json["id"],
        status: json["status"],
        nombre: json["nombre"],
      );
}

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.correo,
    required super.nombre,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        correo: json["correo"],
        nombre: json["nombre"],
      );
}
