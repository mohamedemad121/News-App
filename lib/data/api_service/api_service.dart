import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final baseUrl = 'https://newsapi.org/v2/';
  ApiService({required this.dio});
  Future<Map<String, dynamic>> serviceSearch({required String endPoint}) async {
    final response = await dio.get('$baseUrl$endPoint');

    return response.data;
  }
}
