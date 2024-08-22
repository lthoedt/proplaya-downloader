import 'package:get_it/get_it.dart';
import 'package:proplaya_storage_management/proplaya_storage_management.dart';

final _getIt = GetIt.instance;

class LocatorService {
  Future<void> init() {
    if (!_getIt.isRegistered<ProplayaStorageManagement>()) {
      _getIt.registerSingleton<ProplayaStorageManagement>(
          ProplayaStorageManagement());
    }

    return _getIt.allReady();
  }

  static T locate<T extends Object>() => _getIt<T>();
}
