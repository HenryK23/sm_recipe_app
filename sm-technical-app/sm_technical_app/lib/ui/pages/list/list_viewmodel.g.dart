// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListViewModel on _ListViewModel, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ListViewModel.isLoading', context: context);

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

  late final _$allRecipesAtom =
      Atom(name: '_ListViewModel.allRecipes', context: context);

  @override
  List<RecipeDTO> get allRecipes {
    _$allRecipesAtom.reportRead();
    return super.allRecipes;
  }

  @override
  set allRecipes(List<RecipeDTO> value) {
    _$allRecipesAtom.reportWrite(value, super.allRecipes, () {
      super.allRecipes = value;
    });
  }

  late final _$allIngredientsAtom =
      Atom(name: '_ListViewModel.allIngredients', context: context);

  @override
  Map<String, Ingredient> get allIngredients {
    _$allIngredientsAtom.reportRead();
    return super.allIngredients;
  }

  @override
  set allIngredients(Map<String, Ingredient> value) {
    _$allIngredientsAtom.reportWrite(value, super.allIngredients, () {
      super.allIngredients = value;
    });
  }

  late final _$getAllRecipesAsyncAction =
      AsyncAction('_ListViewModel.getAllRecipes', context: context);

  @override
  Future<void> getAllRecipes() {
    return _$getAllRecipesAsyncAction.run(() => super.getAllRecipes());
  }

  late final _$_ListViewModelActionController =
      ActionController(name: '_ListViewModel', context: context);

  @override
  void getAllIngredients() {
    final _$actionInfo = _$_ListViewModelActionController.startAction(
        name: '_ListViewModel.getAllIngredients');
    try {
      return super.getAllIngredients();
    } finally {
      _$_ListViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
allRecipes: ${allRecipes},
allIngredients: ${allIngredients}
    ''';
  }
}
