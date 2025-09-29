import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManger {
  FlutterSecureStorage appStorage = FlutterSecureStorage();

  Future write(String key, var value) async {
    await appStorage.write(key: key, value: value);
  }

  Future read(String key) async {
    return await appStorage.read(key: key);
  }

  Future delete(String key) async {
    await appStorage.delete(key: key);
  }

  Future deleteAll() async {
    await appStorage.deleteAll();
  }
}
