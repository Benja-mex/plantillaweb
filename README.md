# platilla

# Paquetes a instalar

- [fluro](https://pub.dev/packages/fluro)
- [provider](https://pub.dev/packages/provider)
- [universal_html](https://pub.dev/packages/universal_html)

````
flutter pub add fluro
flutter pub add provider
flutter pub add universal_html
````


## Importante
Para quitar el # de las rutas agregar al pusbsprec.yaml
```
flutter_web_plugins:
    sdk: flutter
 ```
 Tambien agregar en la función main
````
setUrlStrategy(PathUrlStrategy());
````
# Paso 1

## Crear los siguientes directorios de la carpeta lib

- lib
  - config
  - providers
  - routes
  - services
  - ui
    - layouts
      - auth
      - dashboard
    - shared
    - views
    - widgets
 # Paso 2
 Crear en la carpeta config los archivos appconfig.dart, apppage.dart
 
 En el appconfig utilizar el comando `appconfig` en android studio
 ````
 import 'package:flutter/material.dart';

class AppConfig {
  static String appName = '';// Nombre de la empresa
}
 ````
 En el apppage utilizar el comando `apppage` en android studio

````
// ignore: file_names
/*Rutas y nombres de las paginas */
class AppPage {
  static String pageLogin = 'Login';
  static String rutaLogin = '/auth/login';
  static String pageRegistro = 'Registro';
  static String rutaRegistro = '/auth/registro';
  static String pagePanel = 'Panel';
  static String rutaPanel = '/panel';
  static String pageRoot = 'Login';
  static String rutaRoot = '/';
}
````
 # Paso 3
 ## Crear el Layout Login
 
 En el directorio
 - ui
    - layouts
      - auth
 
 crear el archivo authleyout.dart y utilizar el comando `authleyout` en android estudio 
 

 ````
 import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
````
# Paso 4

## Crear el login view

 En el directorio
 - ui
    - views
  
   
 crear el archivo authview.dart y utilizar el comando `authview` en android estudio 
 
 ````
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers,unnecessary_new, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container();
  }
}
 
 ````

# Paso 5

## Configurar las routes

En el directorio
- routes

Crear los archivo auhthandlers.dart y router.dart.

En el archivo auhthandlers utilizar el comando `auhthandlers` en android estudio, agregar la importaciones necesarias

````
// ignore_for_file: use_key_in_widget_constructors,prefer_const_constructors, avoid_unnecessary_containers,unnecessary_new, prefer_const_constructors_in_immutables
import 'package:universal_html/html.dart' as html;
import 'package:fluro/fluro.dart';

class AuthHandlers {
    static Handler login = Handler(handlerFunc: (context, params) {
    html.document.title = AppPage.pageLogin;
    return AuthView();
  });
}
````

En el archivo router utilizar el comando `flurorauter` en android estudio, agregar la importaciones necesarias

````
/*Configuracion basica de las rutas*/
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers,unnecessary_new

//Agregar a las dependencias del pubspec.yaml fluro
import 'package:fluro/fluro.dart';
//Agregar las importaciones necesarias

class Flurorauter {
  static final FluroRouter router = new FluroRouter();

  static void configuracionDeLasRutas() {
    router.define(AppPage.rutaLogin, handler: AuthHandlers.login);
    router.define(AppPage.rutaRoot, handler: AuthHandlers.login);

    router.notFoundHandler = AuthHandlers.login;
  }
}
````

# Paso 6

Borrar el contenido del archivo main.dart y unilizar el comando `mainweb` en android estudio

````
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers,unnecessary_new, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

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
````

