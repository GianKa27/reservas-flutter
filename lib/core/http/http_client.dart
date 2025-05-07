import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import '../env/env.dart';
import 'interceptors.dart';

class HttpClient {
  late final Dio dio;

  HttpClient() {
    dio = Dio(BaseOptions(baseUrl: Env.api, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    }));

    dio.interceptors.add(CustomInterceptors());

    // Add the interceptor
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      // logPrint: print, // specify log function (optional)
      retries: 3, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3), // wait 3 sec before third retry
      ],
    ));
  }
}
