import 'package:yoko_test_task/models/activities/price_info.dart';

class Tariff {
  int? id;
  String? nameRu;
  String? nameKk;
  String? nameEn;
  String? code;
  bool? enabled;
  int? axessMetaTariffId;
  PriceInfo? priceInfo;
  String? createdDate;
  String? updatedDate;

  Tariff(
      {this.id,
      this.nameRu,
      this.nameKk,
      this.nameEn,
      this.code,
      this.enabled,
      this.axessMetaTariffId,
      this.priceInfo,
      this.createdDate,
      this.updatedDate});

  Tariff.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRu = json['nameRu'];
    nameKk = json['nameKk'];
    nameEn = json['nameEn'];
    code = json['code'];
    enabled = json['enabled'];
    axessMetaTariffId = json['axessMetaTariffId'];
    priceInfo = json['priceInfo'] != null
        ? PriceInfo.fromJson(json['priceInfo'])
        : null;
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameRu'] = nameRu;
    data['nameKk'] = nameKk;
    data['nameEn'] = nameEn;
    data['code'] = code;
    data['enabled'] = enabled;
    data['axessMetaTariffId'] = axessMetaTariffId;
    if (priceInfo != null) {
      data['priceInfo'] = priceInfo!.toJson();
    }
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    return data;
  }
}
