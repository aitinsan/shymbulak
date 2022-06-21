import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final securedStorage = SecureStorageHelper();

class SecureStorageHelper {
  final _storage = const FlutterSecureStorage();
  Future<String?> getAuthToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<void> setAuthToken(String token) async {
    return await _storage.write(key: 'auth_token', value: token);
  }
}
