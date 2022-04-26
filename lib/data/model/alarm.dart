import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Alarm extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String coin;
  @HiveField(2)
  final String triggerPrice;
  @HiveField(3)
  final String? ops;

  Alarm(
      {required this.id,
      required this.coin,
      required this.triggerPrice,
      this.ops});
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmAdapter extends TypeAdapter<Alarm> {
  @override
  final int typeId = 0;

  @override
  Alarm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alarm(
      id: fields[0] as int,
      coin: fields[1] as String,
      triggerPrice: fields[2] as String,
      ops: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Alarm obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.coin)
      ..writeByte(2)
      ..write(obj.triggerPrice)
      ..writeByte(3)
      ..write(obj.ops);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
