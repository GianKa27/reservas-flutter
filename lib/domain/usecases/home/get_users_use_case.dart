import 'package:reservations_flutter/domain/entities/home/users_entity.dart';
import 'package:reservations_flutter/domain/repositories/home/home_repository.dart';

class GetUsersUseCase {
  final HomeRepository _homeRepository;

  GetUsersUseCase(this._homeRepository);

  Future<UsersEntity> call() async {
    try {
      final response = await _homeRepository.getUsers();

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
