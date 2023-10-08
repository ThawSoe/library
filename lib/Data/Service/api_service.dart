import 'package:get/get.dart';
import 'package:solinx_code_test/Core/Core_Config/config_result.dart';
import 'package:solinx_code_test/Service/Helper/dio_helper.dart';
import 'package:solinx_code_test/View_Model/search_view_model.dart';

class ApiService {
  DioHelper? dioHelper;

  ApiService() : dioHelper = DioHelper();

  Future<Result> getUsers() async {
    try {
      // Make a GET request to the API endpoint to fetch user data.
      final response = await dioHelper?.getAsync(
          searchKeyWord: Get.find<SearchViewModel>().searchCtrl.value.text);

      // Check if the response status code is 200 (OK).
      if (response?.success ?? false) {
        return Result.success(
            data: response
                ?.data); // If successful, return the response data (List of dynamic).
      } else {
        // If the response status code is not 200, throw an exception with an error message.
        throw Exception('API failed with status code: ${response?.errorCode}');
      }
    } catch (e) {
      // If any exception occurs during the API call, throw an exception with the error message.
      throw Exception('An error occurred: $e');
    }
  }
}
