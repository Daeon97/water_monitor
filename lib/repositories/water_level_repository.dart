import 'package:dio/dio.dart';
import '../models/models.dart' as models;
import '../utils/utils.dart' as utils;

class WaterLevelRepository {
  final Dio _dio;

  WaterLevelRepository()
      : _dio = Dio(
          BaseOptions(
            // connectTimeout: utils.padding.toInt(),
            baseUrl: utils.baseUrl,
          ),
        );

  Future<models.WaterLevel> getWaterLevel() async {
    Response<Map<String, dynamic>> response = await _dio.get(
      utils.path,
    );
    return models.WaterLevel.fromJson(json: response.data!);
  }
}
