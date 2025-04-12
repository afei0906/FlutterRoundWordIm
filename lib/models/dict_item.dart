/// id : 136
/// dictSort : 0
/// dictLabel : "我最喜欢的老师叫什么"
/// dictValue : " user_issues_4"
/// dictType : "user_issues_type"
/// cssClass : ""
/// listClass : ""
/// isDefault : "N"
/// status : "0"
/// createBy : "admin"
/// createTime : "2025-03-23T03:12:27.000+00:00"
/// updateBy : ""
/// updateTime : "2025-04-09T09:56:58.000+00:00"
/// remark : ""
/// otherData : ""
part of 'index.dart';

class DictItem {
  DictItem({
    this.id,
    this.dictSort,
    this.dictLabel,
    this.dictValue,
    this.dictType,
    this.cssClass,
    this.listClass,
    this.isDefault,
    this.status,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.remark,
    this.otherData,
  });

  DictItem.fromJson(dynamic json) {
    id = json['id'];
    dictSort = json['dictSort'];
    dictLabel = json['dictLabel'];
    dictValue = json['dictValue'];
    dictType = json['dictType'];
    cssClass = json['cssClass'];
    listClass = json['listClass'];
    isDefault = json['isDefault'];
    status = json['status'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    remark = json['remark'];
    otherData = json['otherData'];
  }

  dynamic id;
  dynamic dictSort;
  dynamic dictLabel;
  dynamic dictValue;
  dynamic dictType;
  dynamic cssClass;
  dynamic listClass;
  dynamic isDefault;
  dynamic status;
  dynamic createBy;
  dynamic createTime;
  dynamic updateBy;
  dynamic updateTime;
  dynamic remark;
  dynamic otherData;

  DictItem copyWith({
    dynamic id,
    dynamic dictSort,
    dynamic dictLabel,
    dynamic dictValue,
    dynamic dictType,
    dynamic cssClass,
    dynamic listClass,
    dynamic isDefault,
    dynamic status,
    dynamic createBy,
    dynamic createTime,
    dynamic updateBy,
    dynamic updateTime,
    dynamic remark,
    dynamic otherData,
  }) =>
      DictItem(
        id: id ?? this.id,
        dictSort: dictSort ?? this.dictSort,
        dictLabel: dictLabel ?? this.dictLabel,
        dictValue: dictValue ?? this.dictValue,
        dictType: dictType ?? this.dictType,
        cssClass: cssClass ?? this.cssClass,
        listClass: listClass ?? this.listClass,
        isDefault: isDefault ?? this.isDefault,
        status: status ?? this.status,
        createBy: createBy ?? this.createBy,
        createTime: createTime ?? this.createTime,
        updateBy: updateBy ?? this.updateBy,
        updateTime: updateTime ?? this.updateTime,
        remark: remark ?? this.remark,
        otherData: otherData ?? this.otherData,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['dictSort'] = dictSort;
    map['dictLabel'] = dictLabel;
    map['dictValue'] = dictValue;
    map['dictType'] = dictType;
    map['cssClass'] = cssClass;
    map['listClass'] = listClass;
    map['isDefault'] = isDefault;
    map['status'] = status;
    map['createBy'] = createBy;
    map['createTime'] = createTime;
    map['updateBy'] = updateBy;
    map['updateTime'] = updateTime;
    map['remark'] = remark;
    map['otherData'] = otherData;
    return map;
  }
}
