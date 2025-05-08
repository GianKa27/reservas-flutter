import 'package:reservations_flutter/domain/entities/home/spaces_entity.dart';

class SpacesModel extends SpacesEntity {
  SpacesModel({
    required List<SpaceModel> data,
  }) : super(data: data);

  factory SpacesModel.fromJson(Map<String, dynamic> json) => SpacesModel(
        data: List<SpaceModel>.from(
            json["data"].map((x) => SpaceModel.fromJson(x))),
      );
}

class SpaceModel extends SpaceEntity {
  SpaceModel({
    required super.id,
    required super.status,
    required super.nombre,
    required super.imageUrl,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) => SpaceModel(
        id: json["id"],
        status: json["status"],
        nombre: json["nombre"],
        imageUrl: json["imageUrl"],
      );
}
