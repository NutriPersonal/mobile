import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nutripersonal/utils/entities/user_entity.dart';

class SecureStorageService {
  final storage = const FlutterSecureStorage();

  void get(String key) async => await storage.read(key: key);

  void set(String key, String value) async =>
      await storage.write(key: key, value: value);

  void delete(String key) => storage.delete(key: key);

  void deleteAll() => storage.deleteAll();
}
