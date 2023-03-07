// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecipeViewModel on _RecipeViewModel, Store {
  late final _$isLoadingAtom =
      Atom(name: '_RecipeViewModel.isLoading', context: context);

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

  late final _$recipeAtom =
      Atom(name: '_RecipeViewModel.recipe', context: context);

  @override
  RecipeByIdDTO? get recipe {
    _$recipeAtom.reportRead();
    return super.recipe;
  }

  @override
  set recipe(RecipeByIdDTO? value) {
    _$recipeAtom.reportWrite(value, super.recipe, () {
      super.recipe = value;
    });
  }

  late final _$getRecipeByIdAsyncAction =
      AsyncAction('_RecipeViewModel.getRecipeById', context: context);

  @override
  Future<void> getRecipeById(String id, BuildContext context) {
    return _$getRecipeByIdAsyncAction
        .run(() => super.getRecipeById(id, context));
  }

  late final _$openRecipeAsyncAction =
      AsyncAction('_RecipeViewModel.openRecipe', context: context);

  @override
  Future<void> openRecipe() {
    return _$openRecipeAsyncAction.run(() => super.openRecipe());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
recipe: ${recipe}
    ''';
  }
}
