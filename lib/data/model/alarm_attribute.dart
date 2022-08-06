import 'package:hive/hive.dart';
import 'package:app/constants/alarm_attributes.dart';

part 'alarm_attribute.g.dart';

@HiveType(typeId: 0)
class AlarmAttribute extends HiveObject {
  AlarmAttribute({
    required this.coin,
    required this.currency,
    required this.targetPrice,
    required this.indicatorType,
    required this.operatorType,
    required this.notificationType,
  });
  @HiveField(0)
  String coin;

  @HiveField(1)
  String currency;

  @HiveField(2)
  String targetPrice;

  @HiveField(3)
  IndicatorType indicatorType;

  @HiveField(4)
  OperatorType operatorType;

  @HiveField(5)
  AlertType notificationType;
}
