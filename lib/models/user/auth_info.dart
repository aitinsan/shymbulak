import 'package:yoko_test_task/models/user/user.dart';

class AuthInfo {
  String? accessToken;
  int? accessTokenExpiration;
  User? user;

  AuthInfo({this.accessToken, this.accessTokenExpiration, this.user});

  AuthInfo.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    accessTokenExpiration = json['accessTokenExpiration'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['accessTokenExpiration'] = accessTokenExpiration;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
