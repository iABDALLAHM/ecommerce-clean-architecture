import 'package:ecommerce_clean_architecture/core/repositories/local_storage_repository/local_storage_repository.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/local_storage_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalStorageRepository)
class LocalStorageRepositoryImplementation implements LocalStorageRepository {
  final LocalStorageService _localStorageService;

  LocalStorageRepositoryImplementation({
    required LocalStorageService localStorageService,
  }) : _localStorageService = localStorageService;

  @override
  Future<void> clearData() async {
    await _localStorageService.clearData();
  }

  @override
  Future<bool> getBoolean({required String key}) async {
    return await _localStorageService.getBoolean(key: key);
  }

  @override
  Future<void> setBoolean({required String key, required bool value}) async {
    await _localStorageService.setBoolean(key: key, value: value);
  }
}
