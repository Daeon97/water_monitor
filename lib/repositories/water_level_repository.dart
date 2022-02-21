import 'package:dio/dio.dart';
import '../models/models.dart' as models;

class WaterLevelRepository {
  final Dio _dio;

  WaterLevelRepository() : _dio = Dio();

  Future<models.WaterLevel> getWaterLevel() async {
    return const models.WaterLevel(level: 50);
  }
}
