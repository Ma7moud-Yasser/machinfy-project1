import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/services/end_point.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };
      return await dio.get(url, queryParameters: query);
    } on DioException catch (e) {
      return handleError(e);
    }
  }

  static Future<Response?> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };
      return await dio.post(url, data: data, queryParameters: query);
    } on DioException catch (e) {
      return handleError(e);
    }
  }

  static Future<Response?> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };
      return await dio.put(url, data: data, queryParameters: query);
    } on DioException catch (e) {
      return handleError(e);
    }
  }

  static Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };
      return await dio.delete(url, queryParameters: query);
    } on DioException catch (e) {
      return handleError(e);
    }
  }

  /// ✅ **معالجة الأخطاء العامة**
  static Response? handleError(DioException e) {
    String errorMessage;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = "الاتصال بالشبكة استغرق وقتًا طويلاً، حاول لاحقًا.";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "انتهت مهلة إرسال البيانات.";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "انتهت مهلة استلام البيانات.";
        break;
      case DioExceptionType.badResponse:
        errorMessage = "خطأ في الاستجابة: ${e.response?.statusCode}";
        break;
      case DioExceptionType.cancel:
        errorMessage = "تم إلغاء الطلب.";
        break;
      case DioExceptionType.connectionError:
        errorMessage = "خطأ في الاتصال بالشبكة، تحقق من الإنترنت.";
        break;
      default:
        errorMessage = "حدث خطأ غير متوقع.";
    }

    print("❌ Dio Error: $errorMessage");
    return null; // يمكن تعديلها لرمي استثناء خاص أو إعادة استجابة مخصصة
  }
}
