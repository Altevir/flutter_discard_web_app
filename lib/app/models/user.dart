// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_discard_web_app/app/models/avatar.dart';
import 'package:flutter_discard_web_app/app/models/banner.dart';

class User {
  String? id;
  String? createdAt;
  String? tag;
  List<String>? badges;
  Avatar? avatar;
  Banner? banner;

  User({
    required this.id,
    this.createdAt,
    this.tag,
    this.badges,
    this.avatar,
    this.banner,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'tag': tag,
      'badges': badges,
      'avatar': avatar?.toMap(),
      'banner': banner?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      tag: map['tag'] != null ? map['tag'] as String : null,
      badges: map['badges'] != null ? List<String>.from((map['badges'] as List<dynamic>)) : null,
      avatar: map['avatar'] != null ? Avatar.fromMap(map['avatar'] as Map<String, dynamic>) : null,
      banner: map['banner'] != null ? Banner.fromMap(map['banner'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
