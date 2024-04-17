
import 'package:flutter/material.dart';
import 'package:objectbox_demo/addForm.dart';
import 'package:objectbox_demo/main.dart';

class Routes {
  static const addForm = 'AddForm';
  static const home = 'home';

}

// final routes = {
//   Routes.initialRoute: (context) => const MyHomeScreen(),
// };

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.addForm:
        return MaterialPageRoute(builder: ((context) => const AddForm()));
      case Routes.home:
        return MaterialPageRoute(builder: ((context) => const MyHomePage(title: 'Bayan',)));

      default:
        return MaterialPageRoute(builder: ((context) => const MyHomePage(title: 'Bayan',)));
    }
  }
}
