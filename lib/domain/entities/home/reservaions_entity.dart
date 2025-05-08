import 'package:reservations_flutter/domain/entities/home/spaces_entity.dart';

import 'users_entity.dart';

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
  final DateTime startDate;
  final DateTime endDate;
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
