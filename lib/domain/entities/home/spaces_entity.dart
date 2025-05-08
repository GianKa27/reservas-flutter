class SpacesEntity {
  final List<SpaceEntity> data;

  SpacesEntity({
    required this.data,
  });
}

class SpaceEntity {
  final int id;
  final bool status;
  final String nombre;
  final String? imageUrl;

  SpaceEntity({
    required this.id,
    required this.status,
    required this.nombre,
    required this.imageUrl,
  });
}
