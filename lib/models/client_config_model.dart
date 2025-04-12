/// id : 9
/// configName : "私聊间隔"
/// configKey : "chatFriendTimeInterval"
/// configValue : "0"
/// configType : "Y"
/// createBy : "admin"
/// createTime : "2025-03-23T03:12:27.000+00:00"
/// updateBy : ""
/// updateTime : "2025-04-09T08:55:12.000+00:00"
/// remark : "私聊间隔"
/// params : null
part of 'index.dart';

class ClientConfigModel {
  ClientConfigModel({
    this.id,
    this.configName,
    this.configKey,
    this.configValue,
    this.configType,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.remark,
    this.params,
  });

  ClientConfigModel.fromJson(dynamic json) {
    id = json['id'] as num?;
    configName = json['configName'];
    configKey = json['configKey'];
    configValue = json['configValue'];
    configType = json['configType'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    remark = json['remark'];
    params = json['params'];
  }

  num? id;
  dynamic configName;
  dynamic configKey;
  dynamic configValue;
  dynamic configType;
  dynamic createBy;
  dynamic createTime;
  dynamic updateBy;
  dynamic updateTime;
  dynamic remark;
  dynamic params;

  ClientConfigModel copyWith({
    num? id,
    dynamic configName,
    dynamic configKey,
    dynamic configValue,
    dynamic configType,
    dynamic createBy,
    dynamic createTime,
    dynamic updateBy,
    dynamic updateTime,
    dynamic remark,
    dynamic params,
  }) =>
      ClientConfigModel(
        id: id ?? this.id,
        configName: configName ?? this.configName,
        configKey: configKey ?? this.configKey,
        configValue: configValue ?? this.configValue,
        configType: configType ?? this.configType,
        createBy: createBy ?? this.createBy,
        createTime: createTime ?? this.createTime,
        updateBy: updateBy ?? this.updateBy,
        updateTime: updateTime ?? this.updateTime,
        remark: remark ?? this.remark,
        params: params ?? this.params,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['configName'] = configName;
    map['configKey'] = configKey;
    map['configValue'] = configValue;
    map['configType'] = configType;
    map['createBy'] = createBy;
    map['createTime'] = createTime;
    map['updateBy'] = updateBy;
    map['updateTime'] = updateTime;
    map['remark'] = remark;
    map['params'] = params;
    return map;
  }
}
