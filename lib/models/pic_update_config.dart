/// tempAK : null
/// tempSK : null
/// securityToken : null
/// expiration : null
/// bucketName : "tio-test-2"
/// publicBucketName : "tio-domain"
/// endpoint : "https://minio.opghdm.cn"
/// region : ""
/// cloudfrontDomain : null
/// cloudfrontDomainPublic : null
/// accessKey : "M8sCeMV18WMMcT2XT5ff"
/// secretKey : "CoK4KqUsXfJvHC6RFRGz4uXBUxZGIeY6IhrKK9vH"
part of 'index.dart';

class PicUpdateConfig {
  PicUpdateConfig({
    this.tempAK,
    this.tempSK,
    this.securityToken,
    this.expiration,
    this.bucketName,
    this.publicBucketName,
    this.endpoint,
    this.region,
    this.cloudfrontDomain,
    this.cloudfrontDomainPublic,
    this.accessKey,
    this.secretKey,
  });

  PicUpdateConfig.fromJson(dynamic json) {
    tempAK = json['tempAK'];
    tempSK = json['tempSK'];
    securityToken = json['securityToken'];
    expiration = json['expiration'];
    bucketName = json['bucketName'];
    publicBucketName = json['publicBucketName'];
    endpoint = json['endpoint'];
    region = json['region'];
    cloudfrontDomain = json['cloudfrontDomain'];
    cloudfrontDomainPublic = json['cloudfrontDomainPublic'];
    accessKey = json['accessKey'];
    secretKey = json['secretKey'];
  }

  dynamic tempAK;
  dynamic tempSK;
  dynamic securityToken;
  dynamic expiration;
  dynamic bucketName;
  dynamic publicBucketName;
  dynamic endpoint;
  dynamic region;
  dynamic cloudfrontDomain;
  dynamic cloudfrontDomainPublic;
  dynamic accessKey;
  dynamic secretKey;

  PicUpdateConfig copyWith({
    dynamic tempAK,
    dynamic tempSK,
    dynamic securityToken,
    dynamic expiration,
    dynamic bucketName,
    dynamic publicBucketName,
    dynamic endpoint,
    dynamic region,
    dynamic cloudfrontDomain,
    dynamic cloudfrontDomainPublic,
    dynamic accessKey,
    dynamic secretKey,
  }) =>
      PicUpdateConfig(
        tempAK: tempAK ?? this.tempAK,
        tempSK: tempSK ?? this.tempSK,
        securityToken: securityToken ?? this.securityToken,
        expiration: expiration ?? this.expiration,
        bucketName: bucketName ?? this.bucketName,
        publicBucketName: publicBucketName ?? this.publicBucketName,
        endpoint: endpoint ?? this.endpoint,
        region: region ?? this.region,
        cloudfrontDomain: cloudfrontDomain ?? this.cloudfrontDomain,
        cloudfrontDomainPublic:
            cloudfrontDomainPublic ?? this.cloudfrontDomainPublic,
        accessKey: accessKey ?? this.accessKey,
        secretKey: secretKey ?? this.secretKey,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tempAK'] = tempAK;
    map['tempSK'] = tempSK;
    map['securityToken'] = securityToken;
    map['expiration'] = expiration;
    map['bucketName'] = bucketName;
    map['publicBucketName'] = publicBucketName;
    map['endpoint'] = endpoint;
    map['region'] = region;
    map['cloudfrontDomain'] = cloudfrontDomain;
    map['cloudfrontDomainPublic'] = cloudfrontDomainPublic;
    map['accessKey'] = accessKey;
    map['secretKey'] = secretKey;
    return map;
  }
}
