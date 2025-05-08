import 'package:reservations_flutter/domain/entities/home/spaces_entity.dart';
import 'package:reservations_flutter/domain/repositories/home/home_repository.dart';

class GetSpacesUseCase {
  final HomeRepository _homeRepository;

  GetSpacesUseCase(this._homeRepository);

  Future<SpacesEntity> call() async {
    try {
      final response = await _homeRepository.getSpaces();

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
