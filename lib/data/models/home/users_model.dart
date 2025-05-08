import 'package:reservations_flutter/domain/entities/home/users_entity.dart';

class UsersModel extends UsersEntity {
  UsersModel({required List<UserModel> data}) : super(data: data);

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        data: List<UserModel>.from(
            json["data"].map((x) => UserModel.fromJson(x))),
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
