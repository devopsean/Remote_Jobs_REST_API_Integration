import 'dart:convert';

//Packages
import '../services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

//Services
import '../services/http_service.dart';
import '../services/movie_service.dart';
//model
import '../models/app_config.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const SplashPage({
    Key key,
    @required this.onInitializationComplete,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then(
      (_) => _setup(context).then(
        (_) => widget.onInitializationComplete(),
      ),
    );
  }

  Future<void> _setup(BuildContext context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);
    print('check setting up');
    getIt.registerSingleton<AppConfig>(
      AppConfig(
        BASE_API_URL: "https://image.tmdb.org/t/p/original/",
        BASE_IMAGE_API_URL: "https://api.themoviedb.org/3",
        API_KEY: "da35091616d885e40da3073681d64f1c",
      ),
    );
    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );

    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flickd',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
