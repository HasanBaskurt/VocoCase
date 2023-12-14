import 'package:case_app/core/constants/route_constants.dart';
import 'package:case_app/features/auth/view/login_view.dart';
import 'package:case_app/features/home/view/home_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    RouteConstants.routeLoginView: (context) => const LoginView(),
    RouteConstants.routeHomeView: (context) => const HomeView(),
  };
}
