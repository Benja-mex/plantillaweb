/*Configuracion basica de las rutas*/

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers,unnecessary_new
//Agregar a las dependencias del pubspec.yaml fluro
import 'package:fluro/fluro.dart';
import 'package:platilla/config/appPage.dart';
import 'package:platilla/routes/login_handlers.dart';

class Flurorauter {
  static final FluroRouter router = new FluroRouter();

  static void configuracionDeLasRutas() {
    router.define(AppPage.rutaLogin, handler: LoginHandlers.login);
    router.define(AppPage.rutaRoot, handler: LoginHandlers.login);

    router.notFoundHandler = LoginHandlers.login;
  }
}
