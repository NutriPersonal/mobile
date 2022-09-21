import 'dart:convert';

/// See: https://stackoverflow.com/a/70344274/14839095
class UserEntity {
  String? id;
  String? name;
  String? email;
  String? photoUrl;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });
}
