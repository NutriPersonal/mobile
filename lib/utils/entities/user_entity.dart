import 'dart:convert';

class UserEntity {
  String? name;
  String? email;
  String? photoUrl;

  UserEntity({
    required this.name,
    required this.email,
    this.photoUrl,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json['name'],
      email: json['email'],
    );
  }

  static Map<String, dynamic> toMap(UserEntity model) => {
        'name': model.name,
        'email': model.email,
      };

  static String serialize(UserEntity model) =>
      json.encode(UserEntity.toMap(model));

  static UserEntity deserialize(Map<String, dynamic> json) =>
      UserEntity.fromJson(json);
}
