import 'package:hive/hive.dart';
part 'model.g.dart';
@HiveType(typeId: 1)
class studentmodel{
@HiveField(0)
   int? id;
@HiveField(1)
final String Name;
@HiveField(2)
final String Place;
@HiveField(3)
final String phone;
@HiveField(4)
final String photopath;

studentmodel(
  {required this.Name,this.id,
  required this.Place,
  required this.phone,
  required this.photopath
  }
);
}
