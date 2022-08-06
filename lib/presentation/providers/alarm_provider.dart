import 'package:app/constants/alarm_attributes.dart';
import 'package:app/data/model/alarm_attribute.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class AlarmAttributeProvider extends ChangeNotifier {
  int selectedIndex = 0;
  String coin = 'BTC';
  String targetPrice = '69000';
  IndicatorType indicator = IndicatorType(type: Indicator.price);
  OperatorType operatorType = OperatorType(type: Operator.greater);
  AlertType alertType = AlertType(type: Alert.alarm);

  void updateSelectedCoin(String selectedCoin) {
    coin = selectedCoin;
    notifyListeners();
  }

  void updateSelectedIndicator(IndicatorType selectedType) {
    indicator = selectedType;
    notifyListeners();
  }

  void updateSelectedOperator(OperatorType selectedOperator) {
    operatorType = selectedOperator;
    notifyListeners();
  }

  void updateValue(String newTargetPrice) {
    targetPrice = newTargetPrice;
    notifyListeners();
  }

  void updateSelectedAlertType(AlertType selectedAlert) {
    alertType = selectedAlert;
    notifyListeners();
  }

  void updateSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
  }

  void updateFromLocalStorage(AlarmAttribute data) {
    coin = data.coin;
    targetPrice = data.targetPrice;
    indicator = data.indicatorType;
    operatorType = data.operatorType;
    alertType = data.notificationType;
    notifyListeners();
  }
}
