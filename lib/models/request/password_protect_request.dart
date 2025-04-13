/// captchaVerification : "string"
/// loginName : "string"
/// checkIssueList : [{"qcode":"string","qanswer":"string","qnumber":"string","qname":"string"}]
part of '../index.dart';

class PasswordProtectRequest {
  PasswordProtectRequest({
    this.captchaVerification,
    this.loginName,
    this.checkIssueList,
  });

  PasswordProtectRequest.fromJson(dynamic json) {
    captchaVerification = json['captchaVerification'];
    loginName = json['loginName'];
    if (json['checkIssueList'] != null) {
      checkIssueList = [];
      json['checkIssueList'].forEach((v) {
        checkIssueList?.add(CheckIssueList.fromJson(v));
      });
    }
  }

  dynamic captchaVerification;
  dynamic loginName;
  List<CheckIssueList>? checkIssueList;

  PasswordProtectRequest copyWith({
    dynamic captchaVerification,
    dynamic loginName,
    List<CheckIssueList>? checkIssueList,
  }) =>
      PasswordProtectRequest(
        captchaVerification: captchaVerification ?? this.captchaVerification,
        loginName: loginName ?? this.loginName,
        checkIssueList: checkIssueList ?? this.checkIssueList,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if(captchaVerification !=null) {
      map['captchaVerification'] = captchaVerification;
    }
    if(loginName !=null) {
      map['loginName'] = loginName;
    }
    if (checkIssueList != null) {
      map['checkIssueList'] = checkIssueList?.map((v) => v.toJson()).toList();
    }
    return map;
  }


  Map<String, dynamic> toUserIssuesJson() {
    final map = <String, dynamic>{};
    // if(captchaVerification !=null) {
    //   map['captchaVerification'] = captchaVerification;
    // }
    // if(loginName !=null) {
    //   map['loginName'] = loginName;
    // }
    if (checkIssueList != null) {
      map['issueList'] = checkIssueList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// qcode : "string"
/// qanswer : "string"
/// qnumber : "string"
/// qname : "string"

class CheckIssueList {
  CheckIssueList({
    this.qcode,
    this.qanswer,
    this.qnumber,
    this.qname,
  });

  CheckIssueList.fromJson(dynamic json) {
    qcode = json['qcode'];
    qanswer = json['qanswer'];
    qnumber = json['qnumber'];
    qname = json['qname'];
  }

  dynamic qcode;
  dynamic qanswer;
  dynamic qnumber;
  dynamic qname;

  CheckIssueList copyWith({
    dynamic qcode,
    dynamic qanswer,
    dynamic qnumber,
    dynamic qname,
  }) =>
      CheckIssueList(
        qcode: qcode ?? this.qcode,
        qanswer: qanswer ?? this.qanswer,
        qnumber: qnumber ?? this.qnumber,
        qname: qname ?? this.qname,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['qcode'] = qcode;
    map['qanswer'] = qanswer;
    map['qnumber'] = qnumber;
    map['qname'] = qname;
    return map;
  }
}
