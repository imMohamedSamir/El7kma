import 'package:el7kma/Features/ImportView/data/models/ImportItemsModel.dart';
import 'package:hive/hive.dart';

Future<void> callHiveAdapters() async {
  Hive.registerAdapter(ImportItemsModelAdapter());
}
