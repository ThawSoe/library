import 'package:get/get.dart';
import 'package:solinx_code_test/Core/Core_Config/config_result.dart';
import 'package:solinx_code_test/Data/Model/book_model.dart';
import '../Service/api_service.dart';

class ApiRepository {
  final ApiService _apiService = Get.put(
      ApiService()); // Use GetX's Get.find() to get the ApiService instance.

  Future<List<Books>> getUsers() async {
    try {
      Result result = await _apiService.getUsers();
      BookDTO book = BookDTO.fromJson(result.data);
      return book.books ?? [];
    } catch (e) {
      throw Exception('Failed to fetch users');
    }
  }
}
