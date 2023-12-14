import 'dart:convert';

class CurrentUserModel {
  final String email;
  final String password;
  String? token;
  CurrentUserModel({
    required this.email,
    required this.password,
    this.token,
  });

  CurrentUserModel copyWith({
    String? email,
    String? password,
    String? token,
  }) {
    return CurrentUserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});
    if (token != null) {
      result.addAll({'token': token});
    }

    return result;
  }

  factory CurrentUserModel.fromMap(Map<String, dynamic> map) {
    return CurrentUserModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentUserModel.fromJson(String source) =>
      CurrentUserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CurrentUserModel(email: $email, password: $password, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentUserModel &&
        other.email == email &&
        other.password == password &&
        other.token == token;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ token.hashCode;
}
