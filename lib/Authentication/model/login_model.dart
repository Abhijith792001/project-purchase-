class LoginResponseModel {
  final String time;
  final bool success;
  final String token;
  final User user;
  final Role role;

  LoginResponseModel({
    required this.time,
    required this.success,
    required this.token,
    required this.user,
    required this.role,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      time: json['time'] ?? '',
      success: json['success'] ?? false,
      token: json['Token'] ?? '',
      user: User.fromJson(json['user']),
      role: Role.fromJson(json['role']),
    );
  }
}

class User {
  final String username;

  User({required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] ?? '',
    );
  }
}

class Role {
  final String role;

  Role({required this.role});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      role: json['role'] ?? '',
    );
  }
}
