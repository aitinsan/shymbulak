import 'package:flutter/cupertino.dart';
import 'package:yoko_test_task/data/storage/secured_storage.dart';
import 'package:yoko_test_task/models/user/auth_info.dart';
import 'package:yoko_test_task/repositories/auth.repository.dart';

class AuthController extends ChangeNotifier {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  Future<bool> login() async {
    try {
      AuthInfo? authInfo = await AuthRepository().login(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      );
      if (authInfo?.accessToken != null) {
        await securedStorage.setAuthToken(authInfo!.accessToken!);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
