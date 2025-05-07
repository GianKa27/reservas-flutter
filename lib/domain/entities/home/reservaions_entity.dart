class ReservationsEntity {
  final List<ReservationEntity> data;

  ReservationsEntity({
    required this.data,
  });
}

class ReservationEntity {
  final int id;
  final int userId;
  final int spaceId;
  final String startDate;
  final String endDate;
  final bool status;
  final UserEntity user;
  final SpaceEntity space;

  ReservationEntity({
    required this.id,
    required this.userId,
    required this.spaceId,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.user,
    required this.space,
  });
}

class SpaceEntity {
  final int id;
  final bool status;
  final String nombre;

  SpaceEntity({
    required this.id,
    required this.status,
    required this.nombre,
  });
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
