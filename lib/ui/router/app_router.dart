import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'app_pages.dart';

class AppRouter {
  static const initialRoute = "/home_screen";

  static List<GetPage<dynamic>> routes = [
    GetPage(name: '/home_screen', page: () => const HomeScreen()),
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: ((context) => const HomeScreen()));
  }
}
