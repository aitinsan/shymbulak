import 'package:yoko_test_task/data/network/http_query.dart';
import 'package:yoko_test_task/models/user/auth_info.dart';

class AuthRepository {
  final Http _http = Http();
  Future<AuthInfo?> login(
      {required String email, required String password}) async {
    final response = await _http.post(
      url: 'user-service/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return AuthInfo.fromJson(response);
  }
}
