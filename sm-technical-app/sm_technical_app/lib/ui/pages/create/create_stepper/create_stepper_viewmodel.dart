import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sm_technical_app/domain/dtos/response/meals/recipedto.dart';
import 'package:sm_technical_app/domain/dtos/response/meals/reciperesponsedto.dart';
import 'package:sm_technical_app/helpers/viewmodel.dart';
import 'package:sm_technical_app/services/hive_service.dart';
import 'package:sm_technical_app/services/meal_service.dart';

part 'create_stepper_viewmodel.g.dart';

class CreateStepperViewModel = _CreateStepperViewModel
    with _$CreateStepperViewModel;

abstract class _CreateStepperViewModel extends ViewModel with Store {
  final MealService mealService;
  final HiveService hiveService;

  _CreateStepperViewModel(this.mealService, this.hiveService);

  @observable
  PageController pageController = PageController();

  @observable
  int pageIndex = 0;

  @observable
  bool isGenerating = false;

  @observable
  bool isLoading = false;

  @observable
  List<String> excludeFood = [];

  @observable
  List<String> selectedCuisines = [];

  @observable
  RecipeResponseDTO? lunchResponsedto;

  @observable
  String? selectedDietPlan;

  @observable
  RecipeResponseDTO? dinnerResponsedto;

  @observable
  List<RecipeDTO> lunchRecipes = [];

  @observable
  List<RecipeDTO> dinnerRecipes = [];

  @observable
  List<String> lunchImages = [];

  @computed
  String get excludedFoodText {
    excludeFood.removeWhere((food) => food == selectedDietPlan);

    if (excludeFood.isEmpty) {
      return 'None';
    }

    return excludeFood.join(', ').replaceAll('-free', '');
  }

  @computed
  String get cuisineText {
    if (selectedCuisines.isEmpty) {
      return 'None';
    }

    return selectedCuisines.join(', ');
  }

  @action
  void navigateBack({int pageCount = 1}) {
    FocusManager.instance.primaryFocus!.unfocus();
    pageIndex -= pageCount;
    pageController.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
  }

  @action
  void navigateForward({int pageCount = 1}) {
    FocusManager.instance.primaryFocus!.unfocus();
    pageIndex += pageCount;
    pageController.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
  }

  @action
  void toggleExcludeFood(String food) {
    isLoading = true;
    if (isFoodExcluded(food)) {
      excludeFood.remove(food);
    } else {
      excludeFood.add(food);
    }
    isLoading = false;
  }

  @action
  void toggleDietPreference(String food) {
    isLoading = true;
    if (!isFoodExcluded(food)) {
      excludeFood.clear();
      excludeFood.add(food);
      selectedDietPlan = food;
    } else {
      excludeFood.remove(food);
      selectedDietPlan = null;
    }
    isLoading = false;
  }

  @action
  bool isFoodExcluded(String food) {
    return excludeFood.contains(food);
  }

  @action
  void toggleCuisine(String cuisine) {
    isLoading = true;
    if (isCuisineSelected(cuisine)) {
      selectedCuisines.remove(cuisine);
    } else {
      selectedCuisines.add(cuisine);
    }
    isLoading = false;
  }

  @action
  bool isCuisineSelected(String cuisine) {
    return selectedCuisines.contains(cuisine);
  }

  @action
  Future<void> generatePlan() async {
    await getWeeklyLunches();
    await getWeeklyDinners();
  }

  @action
  Future<void> getWeeklyLunches() async {
    var lunchResponse = await mealService.getMealPlanLunches(
        selectedCuisines: selectedCuisines, excludedFoods: excludeFood);

    if (lunchResponse.isSuccess) {
      lunchResponsedto = RecipeResponseDTO.fromMap(lunchResponse.payload);

      for (var i = 0; i < 5; i++) {
        lunchRecipes.add(lunchResponsedto!.hits[i].recipe);
      }

      hiveService.addMealPlanLunchRecipes(lunchRecipes);
    } else {
      //handle error
    }
    isLoading = false;
  }

  @action
  Future<void> getWeeklyDinners() async {
    var dinnerResponse = await mealService.getMealPlanDinners(
        selectedCuisines: selectedCuisines, excludedFoods: excludeFood);

    if (dinnerResponse.isSuccess) {
      dinnerResponsedto = RecipeResponseDTO.fromMap(dinnerResponse.payload);

      for (var i = 0; i < 5; i++) {
        dinnerRecipes.add(dinnerResponsedto!.hits[i].recipe);
      }
      hiveService.addMealPlanDinnerRecipes(dinnerRecipes);
    } else {
      //handle error
    }

    isLoading = false;
  }

  Future<String> getFilePath(String url) async {
    Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath/$url'; // 3

    return filePath;
  }
}
