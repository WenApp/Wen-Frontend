import 'package:hive/hive.dart';

part 'alarm_data.g.dart';

@HiveType(typeId: 0)
class AlarmData extends HiveObject {
  AlarmData({
    this.coin,
    this.currency,
    this.targetPrice,
    this.indicator,
    this.condition,
    this.alert,
  });
  @HiveField(0)
  String? coin;

  @HiveField(1)
  String? currency;

  @HiveField(2)
  String? targetPrice;

  @HiveField(3)
  Indicator? indicator;

  @HiveField(4)
  Condition? condition;

  @HiveField(5)
  Alert? alert;
}

@HiveType(typeId: 4)
enum IndicatorType {
  @HiveField(0)
  price,
  @HiveField(1)
  rsi,
}

@HiveType(typeId: 5)
enum ConditionType {
  @HiveField(0)
  less,
  @HiveField(1)
  greater,
}

@HiveType(typeId: 6)
enum AlertType {
  @HiveField(0)
  notify,
  @HiveField(1)
  alarm,
}

/* 
Indicators to watch such as price
*/
@HiveType(typeId: 1)
class Indicator {
  Indicator({this.type});
  @HiveField(0)
  IndicatorType? type;
}

/*
Conditions such as less than or greater than
*/
@HiveType(typeId: 2)
class Condition {
  Condition({this.type});
  @HiveField(0)
  ConditionType? type;
}

/*
Alerts to notify when a condition is met
*/
@HiveType(typeId: 3)
class Alert {
  Alert({this.type});
  @HiveField(0)
  AlertType? type;
}
