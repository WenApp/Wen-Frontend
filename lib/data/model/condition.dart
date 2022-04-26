/* 
A condition is based off an indicator
*/
abstract class IndicatorType {}

class Price extends IndicatorType {}

class Rsi extends IndicatorType {}

/*
Operators used to create a condition
*/
abstract class Operator {}

class LessThanEQ extends Operator {}

class GreaterThanEQ extends Operator {}

/*
An indicator type, operator along with a value is used
to create a condition for an alarm to trigger
*/
class Condition {
  IndicatorType? indicatorType;
  Operator? operatorType;
  String? value;

  Condition({this.indicatorType, this.operatorType, this.value});

  Map<String, dynamic> asMap() {
    return {
      "indicatorType": indicatorType,
      "operatorType": operatorType,
      "value": value
    };
  }
}
