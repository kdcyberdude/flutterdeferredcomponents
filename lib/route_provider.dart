import 'package:deferred_components/some_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

RouteProvider routeProvider = RouteProvider();


class RouteProvider {
  List<ParallelRoute> routes = [];
  RouteProvider() {
    routes.addAll([
      ChildRoute(
        '/',
        child: (context, args) => const SomeWidget(),
      ),
    ]);
  }

  List<ModularRoute> getRoutes() {
    return routes;
  }

  void addRoute(ModularRoute item) {
    routes.add(item as ParallelRoute);
  }

  void replaceRoute(List<ParallelRoute> item) {
    routes = item;
  }

  void addChildRoute(ChildRoute route) {
    routes.add(route);
  }

  void addModuleRoute(ModuleRoute route) {
    routes.add(route);
  }

  void addAsChildren(String parent, ParallelRoute route) {
    var foundItem = routes.firstWhere((element) => element.name == parent);
    foundItem.children.add(route);
    routes.removeWhere((element) => element.name == parent);
    routes.add(foundItem);
  }
}