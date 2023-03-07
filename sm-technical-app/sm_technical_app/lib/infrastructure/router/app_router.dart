import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_technical_app/ui/pages/create/create_page.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper.dart';
import 'package:sm_technical_app/ui/pages/list/list_page.dart';
import 'package:sm_technical_app/ui/pages/plan/plan_page.dart';
import 'package:sm_technical_app/ui/shared/theme/app_text.dart';

import '../../domain/constants/routes.dart';
import '../../ui/pages/explore/explore_page.dart';
import '../../ui/pages/navigation/navigation_wrapper.dart';
import '../../ui/shared/pages/recipe_page.dart';
import '../di/servicelocator.dart';
import '../di/viewmodelfactory.dart';

ServiceLocator servLoc = ServiceLocator();
ViewModelFactory viewModelFactory = ViewModelFactory(servLoc);

final GoRouter router = GoRouter(routes: [
  GoRoute(
    redirect: (context, state) {
      return Routes.explore.path;
    },
    path: '/',
    pageBuilder: (context, state) => const MaterialPage<void>(
        child: Scaffold(body: Center(child: LinearProgressIndicator()))),
  ),
  GoRoute(
      name: Routes.createStepper.name,
      path: Routes.createStepper.path,
      pageBuilder: (context, state) => MaterialPage<void>(
            child: CreatePlanStepper(viewModelFactory.createPlanStepper()),
          )),
  ShellRoute(
    builder: (context, state, child) {
      if ('/'.allMatches(state.location).length == 1) {
        return NavigationWrapper(child);
      }
      return Scaffold(
        body: child,
      );
    },
    routes: [
      GoRoute(
          name: Routes.explore.name,
          path: Routes.explore.path,
          pageBuilder: (context, state) => MaterialPage<void>(
                child: ExplorePage(viewModelFactory.explore()),
              ),
          routes: [
            GoRoute(
                name: Routes.exploreRecipe.name,
                path: Routes.exploreRecipe.path,
                pageBuilder: (context, state) {
                  final recipeId = state.queryParams['recipeId'];
                  if (recipeId == null) {
                    return MaterialPage<void>(
                      child: Center(
                        child: AppText.subtitle('Error - No recipe Id '),
                      ),
                    );
                  }

                  return MaterialPage<void>(
                    child: RecipePage(viewModelFactory.recipe(), recipeId),
                  );
                }),
          ]),
      GoRoute(
          name: Routes.plan.name,
          path: Routes.plan.path,
          pageBuilder: (context, state) => MaterialPage<void>(
                child: PlanPage(viewModelFactory.plan()),
              ),
          routes: [
            GoRoute(
                name: Routes.planRecipe.name,
                path: Routes.planRecipe.path,
                pageBuilder: (context, state) {
                  final recipeId = state.queryParams['recipeId'];
                  if (recipeId == null) {
                    return MaterialPage<void>(
                      child: Center(
                        child: AppText.subtitle('Error - No recipe Id '),
                      ),
                    );
                  }

                  return MaterialPage<void>(
                    child: RecipePage(viewModelFactory.recipe(), recipeId),
                  );
                }),
          ]),
      GoRoute(
          name: Routes.list.name,
          path: Routes.list.path,
          pageBuilder: (context, state) => MaterialPage<void>(
                child: ListPage(viewModelFactory.list()),
              )),
      GoRoute(
          name: Routes.create.name,
          path: Routes.create.path,
          pageBuilder: (context, state) => const MaterialPage<void>(
                child: CreatePage(),
              )),
    ],
  )
]);
