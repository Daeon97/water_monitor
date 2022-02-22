import 'package:dio/dio.dart';
import '../models/models.dart' as models;
import '../utils/utils.dart' as utils;

class WaterLevelRepository {
  final Dio _dio;

  WaterLevelRepository()
      : _dio = Dio(
          BaseOptions(
            // connectTimeout: 10,
            baseUrl: utils.baseUrl,
          ),
        );

  Future<models.WaterLevel> getWaterLevel() async {
    Response<Map<String, dynamic>> response = await _dio.get(
      utils.path,
    );
    String level = response.data!['feeds'][0]['field1'];
    return models.WaterLevel(level: 20);
  }
}
