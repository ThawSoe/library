import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solinx_code_test/Data/Model/book_model.dart';
import 'package:solinx_code_test/Data/Repository/api_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchViewModel extends GetxController {
  final ApiRepository _userRepository = Get.put(
      ApiRepository()); // Use GetX's Get.find() to get the UserRepository instance.
  final formKey = GlobalKey<FormState>();
  Rx<TextEditingController> searchCtrl = TextEditingController().obs;
  RxList<Books> bookList = <Books>[].obs;
  FocusNode focusNode = FocusNode();
  RxBool isLoading = false.obs;

  List<Books> get users =>
      bookList; // Getter method to access the list of users.
  bool get loading =>
      isLoading.value; // Getter method to access the loading flag.

  Future searchBook() async {
    isLoading.value = true;
    try {
      bookList.value = await _userRepository.getUsers();
      return bookList;
    } catch (e) {
      //  Result.error(e.toString());
    } finally {
      isLoading.value = false;
      update(); // Use GetX's update() to notify listeners of data change.
    }
  }

  launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  int get bookListLenght =>
      bookList.length; //bookList.length > 10 ? 10 : bookList.length;
}
