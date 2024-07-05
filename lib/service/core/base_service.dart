import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:test_task_bank/exceptions%20/api_exception.dart';
import 'package:test_task_bank/exceptions%20/application_exception.dart';
import 'package:test_task_bank/l10n/generated/test_task_app_localizations_en.dart';

abstract class BaseService {
  Future<T> makeErrorParsedCall<T>(AsyncValueGetter<T> callback) async {
    try {
      return await callback();
    } on DioException catch (exception) {
      throw await _getProccessedDioError(exception);
    } on ApplicationException {
      rethrow;
    } on PlatformException catch (exception) {
      throw exception.message ?? exception.details;
    } catch (exception, stackTrace) {
      log(
        exception.toString(),
        name: exception.runtimeType.toString(),
        error: exception.toString(),
        stackTrace: stackTrace,
      );

      rethrow;
    }
  }

  Future<ApiException> _getProccessedDioError(DioException exception) async {
    try {
      await InternetAddress.lookup('example.com');
    } on SocketException catch (_) {
      return ApiException(
        message: TestTaskAppLocalizationsEn().noInternetConnection,
      );
    }

    final unknownApiException = ApiException(
      message: TestTaskAppLocalizationsEn().serverErrorMessage,
    );

    try {
      final response = exception.response?.data;

      if (response == null) {
        return unknownApiException;
      }

      return ApiException(
        statusCode: exception.response?.statusCode,
        message: response['message'].toString(),
      );
    } catch (_) {
      return unknownApiException;
    }
  }
}
