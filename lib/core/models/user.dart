import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class TezdaUser {
  String? email;
  String? displayName;
  final String? uid;
  String? password;

  bool? emailVerified;
  TezdaUser({
    this.uid,
    this.email,
    this.password,
  });

  // Call it from Valid user only
  String get userId => uid! /*"oVKchsqqnKgLxg9u6Vpa8gQyN2v1"*/;

  factory TezdaUser.fromJson(Map<String, dynamic> json) =>
      _$TezdaUserFromJson(json);

  Map<String, dynamic> toJson() => _$TezdaUserToJson(this);

  factory TezdaUser.fromLocalJson(Map<String, dynamic> localJson) {
    return _$TezdaUserFromJson(localJson);
  }

  /// For preferences only
  Map<String, dynamic> toLocalJson() {
    Map<String, dynamic> local = _$TezdaUserToJson(this);
    return local;
  }

  Map<String, dynamic> userToMap() {
    final toUpdate = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        toUpdate[key] = value;
      }
    }

    writeNotNull('displayName', displayName);

    return toUpdate;
  }
}
