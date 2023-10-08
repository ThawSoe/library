import 'package:flutter/material.dart';
import 'package:solinx_code_test/Core/Core_Init/core_init.dart';
import 'Service/Storage/storage_manager.dart';

void main() async {
  await StorageManager.instance.init();
  runApp(const CoreInit());
}
