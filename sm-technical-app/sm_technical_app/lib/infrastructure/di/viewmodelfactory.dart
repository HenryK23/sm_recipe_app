import 'package:sm_technical_app/infrastructure/di/servicelocator.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_viewmodel.dart';
import 'package:sm_technical_app/ui/pages/list/list_viewmodel.dart';
import 'package:sm_technical_app/ui/pages/plan/plan_viewmodel.dart';
import 'package:sm_technical_app/ui/shared/pages/recipe_viewmodel.dart';

import '../../ui/pages/explore/explore_viewmodel.dart';

class ViewModelFactory {
  final ServiceLocator _locator;

  ViewModelFactory(this._locator);

  ExploreViewModel explore() =>
      ExploreViewModel(_locator.mealService!, _locator.hiveService!);

  PlanViewModel plan() => PlanViewModel(_locator.hiveService!);

  ListViewModel list() => ListViewModel(_locator.hiveService!);

  RecipeViewModel recipe() => RecipeViewModel(_locator.mealService!);

  CreateStepperViewModel createPlanStepper() =>
      CreateStepperViewModel(_locator.mealService!, _locator.hiveService!);
}
