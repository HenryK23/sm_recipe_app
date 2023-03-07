import '../models/utility/routeitem.dart';

class Routes {
  //Top Level routes
  static const explore = RouteItem(name: 'explore', path: '/explore');
  static const list = RouteItem(name: 'list', path: '/list');
  static const plan = RouteItem(name: 'plan', path: '/plan');
  static const create = RouteItem(name: 'create', path: '/create');

  //Nested routes
  static const exploreRecipe =
      RouteItem(name: 'exploreRecipe', path: 'exploreRecipe');
  static const planRecipe = RouteItem(name: 'planRecipe', path: 'planRecipe');

  //steppers
  static const createStepper =
      RouteItem(name: 'createStepper', path: '/createStepper');
}
