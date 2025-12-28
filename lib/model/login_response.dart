import 'package:ppob_koperasi_payment/model/user.dart';

class LoginResponse {
  final User? user;
  final String? token;

  LoginResponse({this.user, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'user': user?.toJson(), 'token': token};
  }
}
