const String tableLogin = 'login_db';

class LoginFields {
  static final List<String> values = [
    id,
    username,
    email,
    password,
  ];

  static const String id = '_id';
  static const String username = 'username';
  static const String email = 'email';
  static const String password = 'password';
}

class Login {
  final int? id;
  final String username;
  final String email;
  final String password;

  Login({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, Object?> toJson() => {
        LoginFields.id: id,
        LoginFields.username: username,
        LoginFields.email: email,
        LoginFields.password: password,
      };

  static Login fromJson(Map<String, Object?> json) => Login(
        id: json[LoginFields.id] as int?,
        username: json[LoginFields.username] as String,
        email: json[LoginFields.email] as String,
        password: json[LoginFields.password] as String,
      );

  Login copy({
    int? id,
    String? username,
    String? email,
    String? password,
  }) =>
      Login(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
