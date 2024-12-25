class UserToken {
  late final String accessToken;
  late final String refreshToken;
  UserToken({
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
