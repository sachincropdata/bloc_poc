// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SingleUserModel extends Equatable {
  final String firstName;
  final String lastName;
  final String avatar;
  final String email;

  const SingleUserModel(
    this.firstName,
    this.lastName,
    this.avatar,
    this.email,
  );

  @override
  // TODO: implement props
  List<Object> get props => [firstName, lastName, avatar, email];

  SingleUserModel copyWith({
    String? firstName,
    String? lastName,
    String? avatar,
    String? email,
  }) {
    return SingleUserModel(
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      avatar ?? this.avatar,
      email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
      'email': email,
    };
  }

  factory SingleUserModel.fromMap(Map<String, dynamic> map) {
    return SingleUserModel(
      map['firstName'] as String,
      map['lastName'] as String,
      map['avatar'] as String,
      map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleUserModel.fromJson(String source) =>
      SingleUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
