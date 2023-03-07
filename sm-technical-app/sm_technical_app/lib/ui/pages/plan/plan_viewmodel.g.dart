// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlanViewModel on _PlanViewModel, Store {
  late final _$pageControllerAtom =
      Atom(name: '_PlanViewModel.pageController', context: context);

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

  late final _$lunchRecipesAtom =
      Atom(name: '_PlanViewModel.lunchRecipes', context: context);

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
      Atom(name: '_PlanViewModel.dinnerRecipes', context: context);

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

  late final _$selectedDayIndexAtom =
      Atom(name: '_PlanViewModel.selectedDayIndex', context: context);

  @override
  int get selectedDayIndex {
    _$selectedDayIndexAtom.reportRead();
    return super.selectedDayIndex;
  }

  @override
  set selectedDayIndex(int value) {
    _$selectedDayIndexAtom.reportWrite(value, super.selectedDayIndex, () {
      super.selectedDayIndex = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PlanViewModel.isLoading', context: context);

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

  late final _$encodedImagesAtom =
      Atom(name: '_PlanViewModel.encodedImages', context: context);

  @override
  List<String> get encodedImages {
    _$encodedImagesAtom.reportRead();
    return super.encodedImages;
  }

  @override
  set encodedImages(List<String> value) {
    _$encodedImagesAtom.reportWrite(value, super.encodedImages, () {
      super.encodedImages = value;
    });
  }

  late final _$lunchImagesAtom =
      Atom(name: '_PlanViewModel.lunchImages', context: context);

  @override
  List<Uint8List> get lunchImages {
    _$lunchImagesAtom.reportRead();
    return super.lunchImages;
  }

  @override
  set lunchImages(List<Uint8List> value) {
    _$lunchImagesAtom.reportWrite(value, super.lunchImages, () {
      super.lunchImages = value;
    });
  }

  late final _$getWeeklyRecipesAsyncAction =
      AsyncAction('_PlanViewModel.getWeeklyRecipes', context: context);

  @override
  Future<void> getWeeklyRecipes() {
    return _$getWeeklyRecipesAsyncAction.run(() => super.getWeeklyRecipes());
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
lunchRecipes: ${lunchRecipes},
dinnerRecipes: ${dinnerRecipes},
selectedDayIndex: ${selectedDayIndex},
isLoading: ${isLoading},
encodedImages: ${encodedImages},
lunchImages: ${lunchImages}
    ''';
  }
}
