// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExploreViewModel on _ExploreViewModel, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ExploreViewModel.isLoading', context: context);

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

  late final _$selectedIndexAtom =
      Atom(name: '_ExploreViewModel.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$recommendedRecipesAtom =
      Atom(name: '_ExploreViewModel.recommendedRecipes', context: context);

  @override
  List<RecipeDTO> get recommendedRecipes {
    _$recommendedRecipesAtom.reportRead();
    return super.recommendedRecipes;
  }

  @override
  set recommendedRecipes(List<RecipeDTO> value) {
    _$recommendedRecipesAtom.reportWrite(value, super.recommendedRecipes, () {
      super.recommendedRecipes = value;
    });
  }

  late final _$recommendedRecipeResponseAtom = Atom(
      name: '_ExploreViewModel.recommendedRecipeResponse', context: context);

  @override
  RecipeResponseDTO? get recommendedRecipeResponse {
    _$recommendedRecipeResponseAtom.reportRead();
    return super.recommendedRecipeResponse;
  }

  @override
  set recommendedRecipeResponse(RecipeResponseDTO? value) {
    _$recommendedRecipeResponseAtom
        .reportWrite(value, super.recommendedRecipeResponse, () {
      super.recommendedRecipeResponse = value;
    });
  }

  late final _$categoryRecipesAtom =
      Atom(name: '_ExploreViewModel.categoryRecipes', context: context);

  @override
  List<RecipeDTO> get categoryRecipes {
    _$categoryRecipesAtom.reportRead();
    return super.categoryRecipes;
  }

  @override
  set categoryRecipes(List<RecipeDTO> value) {
    _$categoryRecipesAtom.reportWrite(value, super.categoryRecipes, () {
      super.categoryRecipes = value;
    });
  }

  late final _$categoryRecipeResponseAtom =
      Atom(name: '_ExploreViewModel.categoryRecipeResponse', context: context);

  @override
  RecipeResponseDTO? get categoryRecipeResponse {
    _$categoryRecipeResponseAtom.reportRead();
    return super.categoryRecipeResponse;
  }

  @override
  set categoryRecipeResponse(RecipeResponseDTO? value) {
    _$categoryRecipeResponseAtom
        .reportWrite(value, super.categoryRecipeResponse, () {
      super.categoryRecipeResponse = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_ExploreViewModel.selectedCategory', context: context);

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$categoryButtonPressedAsyncAction =
      AsyncAction('_ExploreViewModel.categoryButtonPressed', context: context);

  @override
  Future<void> categoryButtonPressed(int index) {
    return _$categoryButtonPressedAsyncAction
        .run(() => super.categoryButtonPressed(index));
  }

  late final _$loadRecipesAsyncAction =
      AsyncAction('_ExploreViewModel.loadRecipes', context: context);

  @override
  Future<void> loadRecipes() {
    return _$loadRecipesAsyncAction.run(() => super.loadRecipes());
  }

  late final _$getRecipesAsyncAction =
      AsyncAction('_ExploreViewModel.getRecipes', context: context);

  @override
  Future<void> getRecipes({String? category}) {
    return _$getRecipesAsyncAction
        .run(() => super.getRecipes(category: category));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selectedIndex: ${selectedIndex},
recommendedRecipes: ${recommendedRecipes},
recommendedRecipeResponse: ${recommendedRecipeResponse},
categoryRecipes: ${categoryRecipes},
categoryRecipeResponse: ${categoryRecipeResponse},
selectedCategory: ${selectedCategory}
    ''';
  }
}
