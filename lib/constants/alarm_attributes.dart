import 'package:hive/hive.dart';

part 'alarm_attributes.g.dart';

@HiveType(typeId: 4)
enum Indicator {
  @HiveField(0)
  price,
  @HiveField(1)
  rsi,
}

@HiveType(typeId: 5)
enum Operator {
  @HiveField(0)
  less,
  @HiveField(1)
  greater,
}

@HiveType(typeId: 6)
enum Alert {
  @HiveField(0)
  notify,
  @HiveField(1)
  alarm,
}

//TODO:
// convert these all to enums

/* 
A condition is based off an indicator
*/
@HiveType(typeId: 1)
class IndicatorType {
  IndicatorType({required this.type});
  @HiveField(0)
  Indicator type;
}

/*
Operators used to create a condition
*/
@HiveType(typeId: 2)
class OperatorType {
  OperatorType({required this.type});
  @HiveField(0)
  Operator type;
}

/*
Notification types
*/
@HiveType(typeId: 3)
class AlertType {
  AlertType({required this.type});
  @HiveField(0)
  Alert type;
}
