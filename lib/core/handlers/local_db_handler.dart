import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

mixin class LocalDbHandler {
  static const String customers = 'customers';
  static const String db = 'CustomerDb';

  static Future<BoxCollection> openOrCreateDb() async {
    final directory = await getApplicationDocumentsDirectory();

    return BoxCollection.open(
      db,
      {customers},
      path: directory.path,
    );
  }

  Future<CollectionBox<dynamic>> openCustomersBox() async {
    final collection = await openOrCreateDb();

    return collection.openBox(customers);
  }


}
