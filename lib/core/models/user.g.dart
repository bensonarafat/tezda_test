// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TezdaUser _$TezdaUserFromJson(Map<String, dynamic> json) => TezdaUser(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    )
      ..displayName = json['displayName'] as String?
      ..emailVerified = json['emailVerified'] as bool?;

Map<String, dynamic> _$TezdaUserToJson(TezdaUser instance) => <String, dynamic>{
      'email': instance.email,
      'displayName': instance.displayName,
      'uid': instance.uid,
      'password': instance.password,
      'emailVerified': instance.emailVerified,
    };
