import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../Core/Core_Config/config_constant.dart';
import '../../Data/Model/user_model.dart';

class StorageManager<T> {
  GetStorage? storage;
  UserDTO? user;

  static final StorageManager _instance = StorageManager();
  static StorageManager get instance => _instance;

  Future<StorageManager> init() async {
    await GetStorage.init();
    storage = GetStorage();
    var temp = await getData(key: ConfigConstant.s_user);
    if (temp == null) return this;
    user = UserDTO.fromJson(jsonDecode(temp.toString()));
    return this;
  }

  void saveData({@required String? key, @required T? value}) async {
    storage?.write(key ?? ConfigConstant.s_default, value);
    if (key == ConfigConstant.s_user && value != null) {
      instance.user = UserDTO.fromJson(jsonDecode(value.toString()));
    }
  }

  Future<T> getData({@required String? key}) async {
    T result = (await storage?.read(key ?? ConfigConstant.s_default)) as T;
    return result;
  }

  Future deleteData({@required String? key}) async {
    await storage?.remove(key ?? ConfigConstant.s_default);
  }

  bool get isLoggedIn => user != null;
}
