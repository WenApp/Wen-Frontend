// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_attribute.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmAttributeAdapter extends TypeAdapter<AlarmAttribute> {
  @override
  final int typeId = 0;

  @override
  AlarmAttribute read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlarmAttribute(
      coin: fields[0] as String,
      currency: fields[1] as String,
      targetPrice: fields[2] as String,
      indicatorType: fields[3] as IndicatorType,
      operatorType: fields[4] as OperatorType,
      notificationType: fields[5] as AlertType,
    );
  }

  @override
  void write(BinaryWriter writer, AlarmAttribute obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.coin)
      ..writeByte(1)
      ..write(obj.currency)
      ..writeByte(2)
      ..write(obj.targetPrice)
      ..writeByte(3)
      ..write(obj.indicatorType)
      ..writeByte(4)
      ..write(obj.operatorType)
      ..writeByte(5)
      ..write(obj.notificationType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmAttributeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
