// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:solinx_code_test/Core/Core_Config/config_constant.dart';
import 'package:solinx_code_test/Core/Core_Scaffold/core_scaffold.dart';
import 'package:solinx_code_test/Data/Model/book_model.dart';
import 'package:solinx_code_test/View_Model/search_view_model.dart';
import 'package:solinx_code_test/View_Model/user_view_model.dart';
import '../../Core/Core_View/cache_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  SearchViewModel controller = Get.put(SearchViewModel());
  UserViewModel userController = Get.put((UserViewModel()));

  @override
  Widget build(BuildContext context) {
    return CoreScaffold(
      appBar: AppBar(
          backgroundColor: ConfigConstant.kBlue,
          automaticallyImplyLeading: false,
          title: Obx(() {
            return TypeAheadField(
                loadingBuilder: (context) {
                  return const LinearProgressIndicator();
                },
                minCharsForSuggestions: 2,
                textFieldConfiguration: TextFieldConfiguration(
                    focusNode: controller.focusNode,
                    onSubmitted: (value) {
                      debugPrint("I am onSubmitted");
                      debugPrint(value.toString());
                    },
                    onTap: () {
                      debugPrint("I am tapping");
                    },
                    controller: controller.searchCtrl.value,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(decoration: TextDecoration.none),
                    decoration: const InputDecoration(
                        // contentPadding: EdgeInsets.all(3.0),
                        filled: true,
                        fillColor: ConfigConstant.kWhite,
                        hintText: "Search Book",
                        hintStyle: TextStyle(
                          decoration: TextDecoration.none,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                          size: 20,
                        ),
                        // suffix: controller.searchCtrl.value.text.isEmpty
                        //     ? const SizedBox(width: 0)
                        //     : IconButton(
                        //         padding: const EdgeInsets.all(0.0),
                        //         onPressed: () {
                        //           controller.searchCtrl.value.clear();
                        //           ConfigUtil.hideKeyboard(context);
                        //         },
                        //         icon: const Icon(
                        //           Icons.cancel_outlined,
                        //           color: Colors.black,
                        //           size: 17,
                        //         )),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none)),
                suggestionsCallback: (keyword) async =>
                    await controller.searchBook(),
                itemBuilder: (context, suggestion) {
                  suggestion = suggestion as Books;
                  return ListTile(
                      leading: CacheImageWidget.imageWidgetDelegation(
                          imgurl: suggestion.image, height: 50, width: 50),
                      title: Text(
                        suggestion.title.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      subtitle: Text(suggestion.authors.toString()),
                      trailing: const Icon(Icons.search));
                },
                onSuggestionSelected: (item) {
                  Books tempBook = item as Books;
                  controller.launchURL(tempBook.url.toString());
                });
          }),
          actions: actions()),
      body: Obx(() {
        if (controller.bookList.isEmpty) {
          return const Center(
              child: Text(
            "Please enter book name that you want to search",
            style: ConfigConstant.kTitleTextStyle,
          ));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: controller.bookListLenght,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        CacheImageWidget.imageWidgetDelegation(
                            imgurl: controller.bookList[index].image,
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.all(10.0)),
                        SizedBox(
                          width: Get.width * 0.70,
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(controller.bookList[index].title.toString(),
                                  maxLines: 2,
                                  style: ConfigConstant.kTitleTextStyle),
                              Text(
                                  controller.bookList[index].authors.toString(),
                                  style: ConfigConstant.kSubTitleTextStyle)
                            ],
                          ),
                        )
                      ],
                    );
                  })),
            ),
          ],
        );
      }),
    );
  }

  List<Widget> actions() {
    return [
      PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert_rounded),
        onSelected: (value) {
          if (value == 'logout') {
            userController.logout();
          } else if (value == 'delete_account') {
            userController.deleteAccount();
          }
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            value: 'logout',
            child: Text('Logout'),
          ),
          const PopupMenuItem(
            value: 'delete_account',
            child: Text('Delete Account'),
          ),
        ],
      ),
    ];
  }

  Widget seeMore() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: CupertinoButton.filled(
        onPressed: () async {},
        child: const Text('See More'),
      ),
    );
  }
}
