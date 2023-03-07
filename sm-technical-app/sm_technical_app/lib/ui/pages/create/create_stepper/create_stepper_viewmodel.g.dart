// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_stepper_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateStepperViewModel on _CreateStepperViewModel, Store {
  Computed<String>? _$excludedFoodTextComputed;

  @override
  String get excludedFoodText => (_$excludedFoodTextComputed ??=
          Computed<String>(() => super.excludedFoodText,
              name: '_CreateStepperViewModel.excludedFoodText'))
      .value;
  Computed<String>? _$cuisineTextComputed;

  @override
  String get cuisineText =>
      (_$cuisineTextComputed ??= Computed<String>(() => super.cuisineText,
              name: '_CreateStepperViewModel.cuisineText'))
          .value;

  late final _$pageControllerAtom =
      Atom(name: '_CreateStepperViewModel.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$pageIndexAtom =
      Atom(name: '_CreateStepperViewModel.pageIndex', context: context);

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  late final _$isGeneratingAtom =
      Atom(name: '_CreateStepperViewModel.isGenerating', context: context);

  @override
  bool get isGenerating {
    _$isGeneratingAtom.reportRead();
    return super.isGenerating;
  }

  @override
  set isGenerating(bool value) {
    _$isGeneratingAtom.reportWrite(value, super.isGenerating, () {
      super.isGenerating = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CreateStepperViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$excludeFoodAtom =
      Atom(name: '_CreateStepperViewModel.excludeFood', context: context);

  @override
  List<String> get excludeFood {
    _$excludeFoodAtom.reportRead();
    return super.excludeFood;
  }

  @override
  set excludeFood(List<String> value) {
    _$excludeFoodAtom.reportWrite(value, super.excludeFood, () {
      super.excludeFood = value;
    });
  }

  late final _$selectedCuisinesAtom =
      Atom(name: '_CreateStepperViewModel.selectedCuisines', context: context);

  @override
  List<String> get selectedCuisines {
    _$selectedCuisinesAtom.reportRead();
    return super.selectedCuisines;
  }

  @override
  set selectedCuisines(List<String> value) {
    _$selectedCuisinesAtom.reportWrite(value, super.selectedCuisines, () {
      super.selectedCuisines = value;
    });
  }

  late final _$lunchResponsedtoAtom =
      Atom(name: '_CreateStepperViewModel.lunchResponsedto', context: context);

  @override
  RecipeResponseDTO? get lunchResponsedto {
    _$lunchResponsedtoAtom.reportRead();
    return super.lunchResponsedto;
  }

  @override
  set lunchResponsedto(RecipeResponseDTO? value) {
    _$lunchResponsedtoAtom.reportWrite(value, super.lunchResponsedto, () {
      super.lunchResponsedto = value;
    });
  }

  late final _$selectedDietPlanAtom =
      Atom(name: '_CreateStepperViewModel.selectedDietPlan', context: context);

  @override
  String? get selectedDietPlan {
    _$selectedDietPlanAtom.reportRead();
    return super.selectedDietPlan;
  }

  @override
  set selectedDietPlan(String? value) {
    _$selectedDietPlanAtom.reportWrite(value, super.selectedDietPlan, () {
      super.selectedDietPlan = value;
    });
  }

  late final _$dinnerResponsedtoAtom =
      Atom(name: '_CreateStepperViewModel.dinnerResponsedto', context: context);

  @override
  RecipeResponseDTO? get dinnerResponsedto {
    _$dinnerResponsedtoAtom.reportRead();
    return super.dinnerResponsedto;
  }

  @override
  set dinnerResponsedto(RecipeResponseDTO? value) {
    _$dinnerResponsedtoAtom.reportWrite(value, super.dinnerResponsedto, () {
      super.dinnerResponsedto = value;
    });
  }

  late final _$lunchRecipesAtom =
      Atom(name: '_CreateStepperViewModel.lunchRecipes', context: context);

  @override
  List<RecipeDTO> get lunchRecipes {
    _$lunchRecipesAtom.reportRead();
    return super.lunchRecipes;
  }

  @override
  set lunchRecipes(List<RecipeDTO> value) {
    _$lunchRecipesAtom.reportWrite(value, super.lunchRecipes, () {
      super.lunchRecipes = value;
    });
  }

  late final _$dinnerRecipesAtom =
      Atom(name: '_CreateStepperViewModel.dinnerRecipes', context: context);

  @override
  List<RecipeDTO> get dinnerRecipes {
    _$dinnerRecipesAtom.reportRead();
    return super.dinnerRecipes;
  }

  @override
  set dinnerRecipes(List<RecipeDTO> value) {
    _$dinnerRecipesAtom.reportWrite(value, super.dinnerRecipes, () {
      super.dinnerRecipes = value;
    });
  }

  late final _$generatePlanAsyncAction =
      AsyncAction('_CreateStepperViewModel.generatePlan', context: context);

  @override
  Future<void> generatePlan() {
    return _$generatePlanAsyncAction.run(() => super.generatePlan());
  }

  late final _$getWeeklyLunchesAsyncAction =
      AsyncAction('_CreateStepperViewModel.getWeeklyLunches', context: context);

  @override
  Future<void> getWeeklyLunches() {
    return _$getWeeklyLunchesAsyncAction.run(() => super.getWeeklyLunches());
  }

  late final _$getWeeklyDinnersAsyncAction =
      AsyncAction('_CreateStepperViewModel.getWeeklyDinners', context: context);

  @override
  Future<void> getWeeklyDinners() {
    return _$getWeeklyDinnersAsyncAction.run(() => super.getWeeklyDinners());
  }

  late final _$_CreateStepperViewModelActionController =
      ActionController(name: '_CreateStepperViewModel', context: context);

  @override
  void navigateBack({int pageCount = 1}) {
    final _$actionInfo = _$_CreateStepperViewModelActionController.startAction(
        name: '_CreateStepperViewModel.navigateBack');
    try {
      return super.navigateBack(pageCount: pageCount);
    } finally {
      _$_CreateStepperViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateForward({int pageCount = 1}) {
    final _$actionInfo = _$_CreateStepperViewModelActionController.startAction(
        name: '_CreateStepperViewModel.navigateForward');
    try {
      return super.navigateForward(pageCount: pageCount);
    } finally {
      _$_CreateStepperViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleExcludeFood(String food) {
    final _$actionInfo = _$_CreateStepperViewModelActionController.startAction(
        name: '_CreateStepperViewModel.toggleExcludeFood');
    try {
      return super.toggleExcludeFood(food);
    } finally {
      _$_CreateStepperViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDietPreference(String food) {
    final _$actionInfo = _$_CreateStepperViewModelActionController.startAction(
        name: '_CreateStepperViewModel.toggleDietPreference');
    try {
      return super.toggleDietPreference(food);
    } finally {
      _$_CreateStepperViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isFoodExcluded(String food) {
    final _$actionInfo = _$_CreateStepperViewModelActionController.startAction(
        name: '_CreateStepperViewModel.isFoodExcluded');
    try {
      return super.isFoodExcluded(food);
    } finally {
      _$_CreateStepperViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCuisine(String cuisine) {
    final _$actionInfo = _$_CreateStepperViewModelActionController.startAction(
        name: '_CreateStepperViewModel.toggleCuisine');
    try {
      return super.toggleCuisine(cuisine);
    } finally {
      _$_CreateStepperViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isCuisineSelected(String cuisine) {
    final _$actionInfo = _$_CreateStepperViewModelActionController.startAction(
        name: '_CreateStepperViewModel.isCuisineSelected');
    try {
      return super.isCuisineSelected(cuisine);
    } finally {
      _$_CreateStepperViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
pageIndex: ${pageIndex},
isGenerating: ${isGenerating},
isLoading: ${isLoading},
excludeFood: ${excludeFood},
selectedCuisines: ${selectedCuisines},
lunchResponsedto: ${lunchResponsedto},
selectedDietPlan: ${selectedDietPlan},
dinnerResponsedto: ${dinnerResponsedto},
lunchRecipes: ${lunchRecipes},
dinnerRecipes: ${dinnerRecipes},
excludedFoodText: ${excludedFoodText},
cuisineText: ${cuisineText}
    ''';
  }
}
