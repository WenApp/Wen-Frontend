class Alarm {
  final String? id;
  final String? name;
  final String? coin;
  final String? operator;

  Alarm({this.id, this.name, this.coin, this.operator});

  factory Alarm.fromJSON(Map<String, dynamic> json) {
    return Alarm(
        id: json['id'],
        name: json['name'],
        coin: json['coin'],
        operator: json['operator']);
  }
}
