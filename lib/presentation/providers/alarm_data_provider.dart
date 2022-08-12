import 'package:app/data/model/alarm_data.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class AlarmDataProvider extends ChangeNotifier {
  // default alarm data values
  AlarmData currAlarmData = AlarmData(
    coin: 'BTC',
    currency: 'en_US',
    targetPrice: '69000',
    indicator: Indicator(type: IndicatorType.price),
    condition: Condition(type: ConditionType.greater),
    alert: Alert(type: AlertType.alarm),
  );

  int selectedIndex = 0;
  static final NumberFormat _currencyFormatter =
      NumberFormat.simpleCurrency(locale: 'en_US', decimalDigits: 2);

  void updateSelectedCoin(String selectedCoin) {
    currAlarmData.coin = selectedCoin;
    notifyListeners();
  }

  void updateSelectedIndicator(Indicator selectedIndicator) {
    currAlarmData.indicator = selectedIndicator;
    notifyListeners();
  }

  void updateSelectedOperator(Condition selectedCondition) {
    currAlarmData.condition = selectedCondition;
    notifyListeners();
  }

  void updateValue(String newTargetPrice) {
    currAlarmData.targetPrice =
        _currencyFormatter.format(double.parse(newTargetPrice));
    notifyListeners();
  }

  void updateSelectedAlertType(Alert selectedAlert) {
    currAlarmData.alert = selectedAlert;
    notifyListeners();
  }

  void updateSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
  }

  void updateFromLocalStorage(AlarmData? data) {
    currAlarmData = data ?? AlarmData();
    notifyListeners();
  }
}
