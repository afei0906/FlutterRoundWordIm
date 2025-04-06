part of 'index.dart';

/// result : "success"
/// documentation : "https://www.exchangerate-api.com/docs"
/// terms_of_use : "https://www.exchangerate-api.com/terms"
/// time_last_update_unix : 1716336001
/// time_last_update_utc : "Wed, 22 May 2024 00:00:01 +0000"
/// time_next_update_unix : 1716422401
/// time_next_update_utc : "Thu, 23 May 2024 00:00:01 +0000"
/// base_code : "USD"
/// conversion_rates : {"USD":1,"AED":3.6725,"AFN":71.9073,"ALL":92.4384,"AMD":388.0808,"ANG":1.79,"AOA":854.2092,"ARS":864.75,"AUD":1.4994,"AWG":1.79,"AZN":1.7012,"BAM":1.8013,"BBD":2,"BDT":117.184,"BGN":1.8012,"BHD":0.376,"BIF":2861.1728,"BMD":1,"BND":1.3473,"BOB":6.9216,"BRL":5.1039,"BSD":1,"BTN":83.3215,"BWP":13.5291,"BYN":3.2684,"BZD":2,"CAD":1.3632,"CDF":2758.2167,"CHF":0.9107,"CLP":889.8609,"CNY":7.2399,"COP":3828.6997,"CRC":511.6351,"CUP":24,"CVE":101.5536,"CZK":22.7646,"DJF":177.721,"DKK":6.8713,"DOP":58.6693,"DZD":134.5517,"EGP":46.6849,"ERN":15,"ETB":57.4963,"EUR":0.921,"FJD":2.2509,"FKP":0.7866,"FOK":6.8714,"GBP":0.7866,"GEL":2.7187,"GGP":0.7866,"GHS":14.4649,"GIP":0.7866,"GMD":64.482,"GNF":8566.0923,"GTQ":7.7636,"GYD":209.2863,"HKD":7.8042,"HNL":24.7154,"HRK":6.9392,"HTG":133.1073,"HUF":354.9433,"IDR":16007.7944,"ILS":3.674,"IMP":0.7866,"INR":83.3258,"IQD":1311.1501,"IRR":42098.6017,"ISK":138.2621,"JEP":0.7866,"JMD":156.0885,"JOD":0.709,"JPY":156.2084,"KES":131.2614,"KGS":88.831,"KHR":4090.6943,"KID":1.4994,"KMF":453.1004,"KRW":1362.9169,"KWD":0.3069,"KYD":0.8333,"KZT":441.4243,"LAK":21686.3313,"LBP":89500,"LKR":299.6671,"LRD":193.5228,"LSL":18.0696,"LYD":4.8362,"MAD":9.9109,"MDL":17.6258,"MGA":4416.271,"MKD":56.6259,"MMK":2100.3306,"MNT":3409.8228,"MOP":8.0383,"MRU":39.7814,"MUR":46.0818,"MVR":15.4438,"MWK":1743.294,"MXN":16.6139,"MYR":4.6918,"MZN":63.8095,"NAD":18.0696,"NGN":1497.5072,"NIO":36.8333,"NOK":10.6661,"NPR":133.3145,"NZD":1.6403,"OMR":0.3845,"PAB":1,"PEN":3.7361,"PGK":3.8373,"PHP":58.2102,"PKR":278.4635,"PLN":3.9167,"PYG":7481.588,"QAR":3.64,"RON":4.5783,"RSD":107.8659,"RUB":90.4429,"RWF":1307.4586,"SAR":3.75,"SBD":8.3229,"SCR":14.3538,"SDG":449.4618,"SEK":10.6882,"SGD":1.3472,"SHP":0.7866,"SLE":23.1362,"SLL":23136.1912,"SOS":571.348,"SRD":32.875,"SSP":1798.2207,"STN":22.5644,"SYP":12892.0141,"SZL":18.0696,"THB":36.3295,"TJS":10.9088,"TMT":3.5,"TND":3.1141,"TOP":2.3311,"TRY":32.1961,"TTD":6.7565,"TVD":1.4994,"TWD":32.273,"TZS":2594.3953,"UAH":39.8044,"UGX":3802.18,"UYU":38.6726,"UZS":12731.3365,"VES":36.5589,"VND":25467.0809,"VUV":119.5418,"WST":2.7325,"XAF":604.1339,"XCD":2.7,"XDR":0.7542,"XOF":604.1339,"XPF":109.9043,"YER":250.3114,"ZAR":18.069,"ZMW":25.9886,"ZWL":13.3098}

RateBean rateBeanFromJson(String str) => RateBean.fromJson(json.decode(str));

String rateBeanToJson(RateBean data) => json.encode(data.toJson());

class RateBean {
  RateBean({
    this.result,
    this.documentation,
    this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.baseCode,
    this.conversionRates,
  });

  RateBean.fromJson(dynamic json) {
    result = json['result'];
    documentation = json['documentation'];
    termsOfUse = json['terms_of_use'];
    timeLastUpdateUnix = json['time_last_update_unix'];
    timeLastUpdateUtc = json['time_last_update_utc'];
    timeNextUpdateUnix = json['time_next_update_unix'];
    timeNextUpdateUtc = json['time_next_update_utc'];
    baseCode = json['base_code'];
    conversionRates = json['conversion_rates'] != null
        ? json['conversion_rates'] as Map<String, dynamic>?
        : null;
  }

  dynamic result;
  dynamic documentation;
  dynamic termsOfUse;
  dynamic timeLastUpdateUnix;
  dynamic timeLastUpdateUtc;
  dynamic timeNextUpdateUnix;
  dynamic timeNextUpdateUtc;
  dynamic baseCode;
  Map<String, dynamic>? conversionRates;

  RateBean copyWith({
    dynamic result,
    dynamic documentation,
    dynamic termsOfUse,
    dynamic timeLastUpdateUnix,
    dynamic timeLastUpdateUtc,
    dynamic timeNextUpdateUnix,
    dynamic timeNextUpdateUtc,
    dynamic baseCode,
    Map<String, dynamic>? conversionRates,
  }) =>
      RateBean(
        result: result ?? this.result,
        documentation: documentation ?? this.documentation,
        termsOfUse: termsOfUse ?? this.termsOfUse,
        timeLastUpdateUnix: timeLastUpdateUnix ?? this.timeLastUpdateUnix,
        timeLastUpdateUtc: timeLastUpdateUtc ?? this.timeLastUpdateUtc,
        timeNextUpdateUnix: timeNextUpdateUnix ?? this.timeNextUpdateUnix,
        timeNextUpdateUtc: timeNextUpdateUtc ?? this.timeNextUpdateUtc,
        baseCode: baseCode ?? this.baseCode,
        conversionRates: conversionRates ?? this.conversionRates,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    map['documentation'] = documentation;
    map['terms_of_use'] = termsOfUse;
    map['time_last_update_unix'] = timeLastUpdateUnix;
    map['time_last_update_utc'] = timeLastUpdateUtc;
    map['time_next_update_unix'] = timeNextUpdateUnix;
    map['time_next_update_utc'] = timeNextUpdateUtc;
    map['base_code'] = baseCode;
    map['conversion_rates'] = conversionRates;

    return map;
  }
}
