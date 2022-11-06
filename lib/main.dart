import 'package:data_modular/ViewModel/dataClass%20.dart';
import 'package:deferred_components/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


import 'package:provider/provider.dart';


void main() {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [];

  @override
  List<ModularRoute> get routes => routeProvider.getRoutes();
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DataClass(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Modular',
          theme: ThemeData(primarySwatch: Colors.blue),
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        ));
  }
}






