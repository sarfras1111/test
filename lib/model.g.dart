

part of 'model.dart';



class studentmodelAdapter extends TypeAdapter<studentmodel> {
  @override
  final int typeId = 1;

  @override
  studentmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return studentmodel(
      Name: fields[1] as String,
      id: fields[0] as int?,
      Place: fields[2] as String,
      phone: fields[3] as String,
      photopath: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, studentmodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.Name)
      ..writeByte(2)
      ..write(obj.Place)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.photopath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
