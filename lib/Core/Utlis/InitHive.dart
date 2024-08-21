import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/ImportView/data/models/ImportItemsModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> openHiveBox() async {
  await Hive.openBox<ImportItemsModel>(testItems);
}
