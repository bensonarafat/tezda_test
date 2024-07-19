import 'package:dio/dio.dart';

class ApiDataSource {
  final dio = Dio();
  Future get(url) async {
    final response = await dio.get(url);
    return response;
  }
}
