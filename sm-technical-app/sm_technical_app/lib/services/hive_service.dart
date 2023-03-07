import 'dart:convert';

import 'package:sm_technical_app/domain/dtos/response/meals/recipedto.dart';
import 'package:hive/hive.dart';

import '../domain/constants/hiveboxconstants.dart';

class HiveService {
  //Recommended Recipes
  addAllRecommendedRecipes(List<RecipeDTO> allRecommendedRecipes) {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.put(HiveBoxConstants.recommendedRecipeKey,
        jsonEncode(allRecommendedRecipes));
  }

  List<RecipeDTO> getAllRecommendedRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    var allRecommendedRecipes = box.get(HiveBoxConstants.recommendedRecipeKey);
    if (allRecommendedRecipes != null) {
      return (jsonDecode(allRecommendedRecipes) as List)
          .map((e) => RecipeDTO.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  clearRecommendedRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.delete(HiveBoxConstants.recommendedRecipeKey);
  }

  //Lunch Category Recipes
  addAllLunchRecipes(List<RecipeDTO> allLunchRecipes) {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.put(HiveBoxConstants.lunchRecipeKey, jsonEncode(allLunchRecipes));
  }

  List<RecipeDTO> getAllLunchRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    var allLunchRecipes = box.get(HiveBoxConstants.lunchRecipeKey);
    if (allLunchRecipes != null) {
      return (jsonDecode(allLunchRecipes) as List)
          .map((e) => RecipeDTO.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  clearLunchRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.delete(HiveBoxConstants.lunchRecipeKey);
  }

  //Dinner Category Recipes
  addAllDinnerRecipes(List<RecipeDTO> allDinnerRecipes) {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.put(HiveBoxConstants.dinnerRecipeKey, jsonEncode(allDinnerRecipes));
  }

  List<RecipeDTO> getAllDinnerRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    var allDinnerRecipes = box.get(HiveBoxConstants.dinnerRecipeKey);
    if (allDinnerRecipes != null) {
      return (jsonDecode(allDinnerRecipes) as List)
          .map((e) => RecipeDTO.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  clearDinnerRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.delete(HiveBoxConstants.dinnerRecipeKey);
  }

  //Storing timer for updating recipes.
  addLastUpdatedRecipes(DateTime lastUpdated) {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.put(HiveBoxConstants.lastUpdatedKey, lastUpdated);
  }

  DateTime? getLastUpdatedRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    var lastUpdated = box.get(HiveBoxConstants.lastUpdatedKey);
    return lastUpdated;
  }

  //Weekly Meal Plan
  addMealPlanDinnerRecipes(List<RecipeDTO> allMealPlanDinnerRecipes) {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.put(HiveBoxConstants.dinnerMealPlanKey,
        jsonEncode(allMealPlanDinnerRecipes));
  }

  List<RecipeDTO> getMealPlanDinnerRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    var allMealPlanDinnerRecipes = box.get(HiveBoxConstants.dinnerMealPlanKey);
    if (allMealPlanDinnerRecipes != null) {
      return (jsonDecode(allMealPlanDinnerRecipes) as List)
          .map((e) => RecipeDTO.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  clearMealPlanDinnerRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.delete(HiveBoxConstants.dinnerMealPlanKey);
  }

  addMealPlanLunchRecipes(List<RecipeDTO> allMealPlanLunchRecipes) {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.put(
        HiveBoxConstants.lunchMealPlanKey, jsonEncode(allMealPlanLunchRecipes));
  }

  List<RecipeDTO> getMealPlanLunchRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    var allMealPlanLunchRecipes = box.get(HiveBoxConstants.lunchMealPlanKey);
    if (allMealPlanLunchRecipes != null) {
      return (jsonDecode(allMealPlanLunchRecipes) as List)
          .map((e) => RecipeDTO.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  addMealPlanLunchImages(List<String> base64Images) {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.put(HiveBoxConstants.lunchMealPlanImagesKey, base64Images);
  }

  List<String> getMealPlanLunchImages() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    var allMealPlanLunchImages =
        box.get(HiveBoxConstants.lunchMealPlanImagesKey);
    if (allMealPlanLunchImages != null) {
      return allMealPlanLunchImages;
    } else {
      return [];
    }
  }

  clearMealPlanLunchRecipes() {
    var box = Hive.box(HiveBoxConstants.recipeBox);
    box.delete(HiveBoxConstants.lunchMealPlanKey);
  }
}
