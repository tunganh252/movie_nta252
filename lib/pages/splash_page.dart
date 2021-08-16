import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_nta252/models/app_config.dart';
import 'package:movie_nta252/services/http_service.dart';
import 'package:movie_nta252/services/movie_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.onInitializationComplete})
      : super(key: key);

  final VoidCallback onInitializationComplete;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then(
        (_) => _setup(context).then((_) => widget.onInitializationComplete()));
  }

  Future<void> _setup(BuildContext context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString("assets/config/main.json");
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(AppConfig(
        apiKey: configData['API_KEY'],
        baseApiUrl: configData['BASE_API_URL'],
        baseImageApiUrl: configData['BASE_IMAGE_API_URL']));

    getIt.registerSingleton<HTTPService>(HTTPService());

    getIt.registerSingleton<MovieService>(MovieService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie NTA",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/logo.png'))),
        ),
      ),
    );
  }
}
