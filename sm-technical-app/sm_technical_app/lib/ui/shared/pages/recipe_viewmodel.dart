import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sm_technical_app/domain/dtos/response/meals/recipebyiddto.dart';
import 'package:sm_technical_app/helpers/viewmodel.dart';
import 'package:sm_technical_app/services/meal_service.dart';
import 'package:url_launcher/url_launcher.dart';

part 'recipe_viewmodel.g.dart';

class RecipeViewModel = _RecipeViewModel with _$RecipeViewModel;

abstract class _RecipeViewModel extends ViewModel with Store {
  final MealService mealService;

  _RecipeViewModel(this.mealService);

  @observable
  bool isLoading = false;

  @observable
  RecipeByIdDTO? recipe;

  @action
  Future<void> getRecipeById(String id, BuildContext context) async {
    isLoading = true;
    var response = await mealService.getRecipeById(id);

    if (response.isSuccess) {
      recipe = RecipeByIdDTO.fromMap(response.payload['recipe']);
    } else {
      GoRouter.of(context).pop();
    }
    isLoading = false;
  }

  @action
  Future<void> openRecipe() async {
    var url = Uri.parse(recipe!.url!);
    await _launchUrl(url);
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
