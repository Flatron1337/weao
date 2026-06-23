// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveFavoriteAdapter extends TypeAdapter<HiveFavorite> {
  @override
  final typeId = 0;

  @override
  HiveFavorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveFavorite(title: fields[0] as String);
  }

  @override
  void write(BinaryWriter writer, HiveFavorite obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveFavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveCachedResultAdapter extends TypeAdapter<HiveCachedResult> {
  @override
  final typeId = 1;

  @override
  HiveCachedResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCachedResult(
      path: fields[0] as String,
      jsonBody: fields[1] as String,
      cachedAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCachedResult obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.path)
      ..writeByte(1)
      ..write(obj.jsonBody)
      ..writeByte(2)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCachedResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
