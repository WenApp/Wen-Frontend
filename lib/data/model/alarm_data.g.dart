// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmDataAdapter extends TypeAdapter<AlarmData> {
  @override
  final int typeId = 0;

  @override
  AlarmData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlarmData(
      coin: fields[0] as String?,
      currency: fields[1] as String?,
      targetPrice: fields[2] as String?,
      indicator: fields[3] as Indicator?,
      condition: fields[4] as Condition?,
      alert: fields[5] as Alert?,
    );
  }

  @override
  void write(BinaryWriter writer, AlarmData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.coin)
      ..writeByte(1)
      ..write(obj.currency)
      ..writeByte(2)
      ..write(obj.targetPrice)
      ..writeByte(3)
      ..write(obj.indicator)
      ..writeByte(4)
      ..write(obj.condition)
      ..writeByte(5)
      ..write(obj.alert);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IndicatorAdapter extends TypeAdapter<Indicator> {
  @override
  final int typeId = 1;

  @override
  Indicator read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Indicator(
      type: fields[0] as IndicatorType?,
    );
  }

  @override
  void write(BinaryWriter writer, Indicator obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndicatorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ConditionAdapter extends TypeAdapter<Condition> {
  @override
  final int typeId = 2;

  @override
  Condition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Condition(
      type: fields[0] as ConditionType?,
    );
  }

  @override
  void write(BinaryWriter writer, Condition obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlertAdapter extends TypeAdapter<Alert> {
  @override
  final int typeId = 3;

  @override
  Alert read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alert(
      type: fields[0] as AlertType?,
    );
  }

  @override
  void write(BinaryWriter writer, Alert obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IndicatorTypeAdapter extends TypeAdapter<IndicatorType> {
  @override
  final int typeId = 4;

  @override
  IndicatorType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return IndicatorType.price;
      case 1:
        return IndicatorType.rsi;
      default:
        return IndicatorType.price;
    }
  }

  @override
  void write(BinaryWriter writer, IndicatorType obj) {
    switch (obj) {
      case IndicatorType.price:
        writer.writeByte(0);
        break;
      case IndicatorType.rsi:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndicatorTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ConditionTypeAdapter extends TypeAdapter<ConditionType> {
  @override
  final int typeId = 5;

  @override
  ConditionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ConditionType.less;
      case 1:
        return ConditionType.greater;
      default:
        return ConditionType.less;
    }
  }

  @override
  void write(BinaryWriter writer, ConditionType obj) {
    switch (obj) {
      case ConditionType.less:
        writer.writeByte(0);
        break;
      case ConditionType.greater:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConditionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlertTypeAdapter extends TypeAdapter<AlertType> {
  @override
  final int typeId = 6;

  @override
  AlertType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AlertType.notify;
      case 1:
        return AlertType.alarm;
      default:
        return AlertType.notify;
    }
  }

  @override
  void write(BinaryWriter writer, AlertType obj) {
    switch (obj) {
      case AlertType.notify:
        writer.writeByte(0);
        break;
      case AlertType.alarm:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
