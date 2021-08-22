import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_nta252/models/app_config.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  String? baseUrl;
  String? apiKey;

  HTTPService() {
    AppConfig _config = getIt.get<AppConfig>();
    baseUrl = _config.baseApiUrl;
    apiKey = _config.apiKey;
  }

  Future<Response?> get(String _path, {Map<String, dynamic>? query}) async {
    try {
      String _url = '$baseUrl$_path';
      Map<String, dynamic> _query = {
        'api_key': apiKey,
        'language': 'en-US',
      };
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(_url, queryParameters: _query);
    } on DioError catch (e) {
      print('Unable to perform get request.');
      print('DioError:$e');
    }
  }
}
