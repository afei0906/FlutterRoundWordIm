part of 'index.dart';

/// ID : 3
/// Name : "Couple"

GroupsTypes groupsTypesFromJson(String str) =>
    GroupsTypes.fromJson(json.decode(str));

String groupsTypesToJson(GroupsTypes data) => json.encode(data.toJson());

class GroupsTypes {
  GroupsTypes({
    this.id,
    this.name,
  });

  GroupsTypes.fromJson(dynamic json) {
    id = json['ID'] as num?;
    name = json['Name'] as String?;
  }

  num? id;
  String? name;

  GroupsTypes copyWith({
    num? id,
    String? name,
  }) =>
      GroupsTypes(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['Name'] = name;
    return map;
  }
}
