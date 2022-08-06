// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_attributes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IndicatorTypeAdapter extends TypeAdapter<IndicatorType> {
  @override
  final int typeId = 1;

  @override
  IndicatorType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IndicatorType(
      type: fields[0] as Indicator,
    );
  }

  @override
  void write(BinaryWriter writer, IndicatorType obj) {
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
      other is IndicatorTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OperatorTypeAdapter extends TypeAdapter<OperatorType> {
  @override
  final int typeId = 2;

  @override
  OperatorType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OperatorType(
      type: fields[0] as Operator,
    );
  }

  @override
  void write(BinaryWriter writer, OperatorType obj) {
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
      other is OperatorTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlertTypeAdapter extends TypeAdapter<AlertType> {
  @override
  final int typeId = 3;

  @override
  AlertType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlertType(
      type: fields[0] as Alert,
    );
  }

  @override
  void write(BinaryWriter writer, AlertType obj) {
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
      other is AlertTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IndicatorAdapter extends TypeAdapter<Indicator> {
  @override
  final int typeId = 4;

  @override
  Indicator read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Indicator.price;
      case 1:
        return Indicator.rsi;
      default:
        return Indicator.price;
    }
  }

  @override
  void write(BinaryWriter writer, Indicator obj) {
    switch (obj) {
      case Indicator.price:
        writer.writeByte(0);
        break;
      case Indicator.rsi:
        writer.writeByte(1);
        break;
    }
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

class OperatorAdapter extends TypeAdapter<Operator> {
  @override
  final int typeId = 5;

  @override
  Operator read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Operator.less;
      case 1:
        return Operator.greater;
      default:
        return Operator.less;
    }
  }

  @override
  void write(BinaryWriter writer, Operator obj) {
    switch (obj) {
      case Operator.less:
        writer.writeByte(0);
        break;
      case Operator.greater:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OperatorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlertAdapter extends TypeAdapter<Alert> {
  @override
  final int typeId = 6;

  @override
  Alert read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Alert.notify;
      case 1:
        return Alert.alarm;
      default:
        return Alert.notify;
    }
  }

  @override
  void write(BinaryWriter writer, Alert obj) {
    switch (obj) {
      case Alert.notify:
        writer.writeByte(0);
        break;
      case Alert.alarm:
        writer.writeByte(1);
        break;
    }
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
