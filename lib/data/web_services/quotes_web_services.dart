import 'package:breaking_bad/constants/app_strings.dart';
import 'package:dio/dio.dart';

class QuotesWebServices {
  late Dio dio;

  QuotesWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getCharacterQuotes(String characterName) async {
    try {
      Response response = await dio.get('quote', queryParameters: {
        'author': characterName,
      });
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
