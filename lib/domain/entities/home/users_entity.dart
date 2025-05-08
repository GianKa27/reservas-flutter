class UsersEntity {
  final List<UserEntity> data;
  UsersEntity({required this.data});
}

class UserEntity {
  final int id;
  final String correo;
  final String nombre;
  UserEntity({
    required this.id,
    required this.correo,
    required this.nombre,
  });
}
