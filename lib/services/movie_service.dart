import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:movie_nta252/services/http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  HTTPService? http;

  MovieService() {
    http = getIt.get<HTTPService>();
  }
}
