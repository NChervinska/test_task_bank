import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api/api_client.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio() {
    return Dio()
      ..options.sendTimeout = const Duration(seconds: 1000)
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
  }

  @lazySingleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);
}
