// ignore_for_file: use_key_in_widget_constructors,prefer_const_constructors, avoid_unnecessary_containers,unnecessary_new, prefer_const_constructors_in_immutables
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:platilla/config/appPage.dart';
import 'package:platilla/ui/Views/login_view.dart';

class LoginHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    html.document.title = AppPage.pageLogin;
    return LoginView();
  });
}
