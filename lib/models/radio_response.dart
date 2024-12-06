class RadioResponse {
  RadioResponse({
    this.radios,
  });

  RadioResponse.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(Radio.fromJson(v));
      });
    }
  }

  List<Radio>? radios;
}

class Radio {
  Radio({
    this.id,
    this.name,
    this.url,
    this.recentDate,
  });

  Radio.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }

  int? id;
  String? name;
  String? url;
  String? recentDate;
}
