import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/email_create_screem.dart';
import 'package:flutter_application_1/src/ui/email_signin_screem.dart';
import 'package:flutter_application_1/src/ui/home_screem.dart';
import 'package:flutter_application_1/src/ui/intro_screem.dart';
import 'package:flutter_application_1/src/ui/juego/home.dart';
import 'package:flutter_application_1/src/ui/premios.dart';
import 'package:flutter_application_1/src/ui/profile.dart';
import 'package:flutter_application_1/src/ui/splash_screem.dart';
import 'package:flutter_application_1/src/ui/entrega.dart';
import 'package:flutter_application_1/src/ui/juego/region.dart';


class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const home = '/home';
  static const createAccount = '/createAccount';
  static const signInEmail = '/signInEmail';
  static const profile = '/profile';
  static const homeJuego = '/homeJuego';
  static const premiosJ = '/premios';
  static const entregaP = '/entrega';
  static const initJuego = '/iniJuego';


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
      case homeJuego:
        return _buildRoute(homepage.create);
      case premiosJ:
        return _buildRoute(premios.create);
      case entregaP:
        return _buildRoute(entrega.create);
      case initJuego:
        return _buildRoute(region.create);
      default:
        throw Exception('Route name not exists');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
  //hola
}
