import 'package:hive/hive.dart';
part 'contact.g.dart';

@HiveType(typeId: 0, adapterName: 'ContactAdapter')
class Contact extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  Contact({required this.name, required this.age});

}