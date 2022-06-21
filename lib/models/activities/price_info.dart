class PriceInfo {
  bool? enabled;
  double? price;
  String? currency;
  bool? hasPickupBox;
  String? date;

  PriceInfo(
      {this.enabled, this.price, this.currency, this.hasPickupBox, this.date});

  PriceInfo.fromJson(Map<String, dynamic> json) {
    enabled = json['enabled'];
    price = json['price'];
    currency = json['currency'];
    hasPickupBox = json['hasPickupBox'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enabled'] = enabled;
    data['price'] = price;
    data['currency'] = currency;
    data['hasPickupBox'] = hasPickupBox;
    data['date'] = date;
    return data;
  }
}
