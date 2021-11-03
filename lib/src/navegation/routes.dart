import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/email_create_screem.dart';
import 'package:flutter_application_1/src/ui/email_signin_screem.dart';
import 'package:flutter_application_1/src/ui/home_screem.dart';
import 'package:flutter_application_1/src/ui/intro_screem.dart';
import 'package:flutter_application_1/src/ui/profile.dart';
import 'package:flutter_application_1/src/ui/splash_screem.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const home = '/home';
  static const createAccount = '/createAccount';
  static const signInEmail = '/signInEmail';
  static const profile = '/profile';

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashScreem.create);
      case intro:
        return _buildRoute(IntroScreem.create);
      case home:
        return _buildRoute(HomeScreem.create);
      case createAccount:
        return _buildRoute(EmailCreate.create);
      case signInEmail:
        return _buildRoute(EmailSignIn.create);
      case profile:
        return _buildRoute(Profile.create);
      default:
        throw Exception('Route name not exists');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
