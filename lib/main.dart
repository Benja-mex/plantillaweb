// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers,unnecessary_new, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:platilla/config/appPage.dart';
import 'package:platilla/routes/router.dart';
import 'package:platilla/ui/layouts/auth/auth.dart';

import 'config/appconfig.dart';

void main() {
  Flurorauter.configuracionDeLasRutas();
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      initialRoute: AppPage.rutaLogin,
      onGenerateRoute: Flurorauter.router.generator,
      builder: (_, child) {
        return AuthLayout();
      },
    );
  }
}
//Paso 1: Instalar paquetes
/* Paquetes necesarios*/
//fluro
//universal_html
//providers


//Directorios
/*
config : Configuraciones
ui: Interfas grafica
...layouts: Paginas web
...widgets: Widgets de las vistas
......config: widgets para construir otros widgest
...views:vistas de las paginas
providers:
services:
routes:
*/
