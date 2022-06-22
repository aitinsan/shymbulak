import 'package:yoko_test_task/models/activities/tariff.dart';

class Activity {
  int? id;
  List<String>? availableDates;
  String? nameRu;
  String? nameKk;
  String? nameEn;
  String? imageUrl;
  String? code;
  bool? enabled;
  bool? dateRequired;
  bool? skiPassRequired;
  List<Tariff>? tariffs;
  String? createdDate;
  String? updatedDate;
  String? description;
  Activity(
      {this.id,
      this.availableDates,
      this.nameRu,
      this.nameKk,
      this.nameEn,
      this.imageUrl,
      this.code,
      this.enabled,
      this.dateRequired,
      this.skiPassRequired,
      this.tariffs,
      this.createdDate,
      this.updatedDate,
      this.description});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    availableDates = json['availableDates'].cast<String>();
    nameRu = json['nameRu'];
    nameKk = json['nameKk'];
    nameEn = json['nameEn'];
    imageUrl = json['imageUrl'];
    code = json['code'];
    description = json['description'];

    enabled = json['enabled'];
    dateRequired = json['dateRequired'];
    skiPassRequired = json['skiPassRequired'];
    if (json['tariffs'] != null) {
      tariffs = <Tariff>[];
      json['tariffs'].forEach((v) {
        tariffs!.add(Tariff.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['availableDates'] = availableDates;
    data['nameRu'] = nameRu;
    data['nameKk'] = nameKk;
    data['nameEn'] = nameEn;
    data['imageUrl'] = imageUrl;
    data['code'] = code;
    data['enabled'] = enabled;
    data['dateRequired'] = dateRequired;
    data['skiPassRequired'] = skiPassRequired;
    if (tariffs != null) {
      data['tariffs'] = tariffs!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    data['description'] = description;
    return data;
  }
}
