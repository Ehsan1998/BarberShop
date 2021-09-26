import 'dart:convert';

AccessToken accessTokenFromJson(String str) =>
    AccessToken.fromJson(json.decode(str));

String accessTokenToJson(AccessToken data) => json.encode(data.toJson());

class AccessToken {
  AccessToken({
    this.accessToken,
    this.tokenType,
    this.expiresAt,
  });

  String accessToken;
  String tokenType;
  DateTime expiresAt;

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresAt: DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_at": expiresAt.toIso8601String(),
      };
}
