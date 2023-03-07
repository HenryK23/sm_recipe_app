import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:sm_technical_app/domain/dtos/response/meals/recipedto.dart';
import 'package:sm_technical_app/domain/dtos/response/meals/reciperesponsedto.dart';
import 'package:sm_technical_app/domain/models/api/response_model.dart';
import 'package:sm_technical_app/helpers/viewmodel.dart';
import 'package:sm_technical_app/services/hive_service.dart';

import '../../../helpers/deviceconnection.dart';
import '../../../services/meal_service.dart';

part 'explore_viewmodel.g.dart';

class ExploreViewModel = _ExploreViewModel with _$ExploreViewModel;

abstract class _ExploreViewModel extends ViewModel with Store {
  final MealService mealService;
  final HiveService hiveService;

  _ExploreViewModel(this.mealService, this.hiveService);

  @observable
  bool isLoading = false;

  @observable
  int selectedIndex = 0;

  @observable
  List<RecipeDTO> recommendedRecipes = [];

  @observable
  RecipeResponseDTO? recommendedRecipeResponse;

  @observable
  List<RecipeDTO> categoryRecipes = [];

  @observable
  RecipeResponseDTO? categoryRecipeResponse;

  @observable
  String selectedCategory = 'brunch';

  @action
  Future<void> categoryButtonPressed(int index) async {
    selectedIndex = index;
    isLoading = true;

    bool shouldUpdate = hiveService
            .getLastUpdatedRecipes()
            ?.isBefore(DateTime.now().subtract(const Duration(minutes: 2))) ??
        true;

    if (shouldUpdate) {
      await loadRecipes();
    }

    switch (index) {
      case 0:
        selectedCategory = 'brunch';
        await getRecipes(category: 'brunch');
        break;
      case 1:
        selectedCategory = 'dinner';
        await getRecipes(category: 'dinner');
        break;
    }
    isLoading = false;
  }

  @action
  Future<void> loadRecipes() async {
    isLoading = true;
    await getRecipes();
    await getRecipes(category: 'dinner');
    await getRecipes(category: 'brunch');
    hiveService.addLastUpdatedRecipes(DateTime.now());

    isLoading = false;
  }

  @action
  Future<void> getRecipes({String? category}) async {
    final ResponseModel response;
    var connStatus = await DeviceConnection.status;

    if (connStatus != ConnectivityResult.none) {
      if (hiveService
              .getLastUpdatedRecipes()
              ?.isBefore(DateTime.now().subtract(const Duration(minutes: 2))) ??
          true) {
        response = await mealService.getRandomMeals(mealType: category);

        if (response.isSuccess) {
          _setAndAddRecipes(category, response);
        } else {
          Fluttertoast.showToast(msg: 'Error, ${response.payload}');
        }
      } else {
        _returnHiveRecipes(category);
      }
    } else {
      _returnHiveRecipes(category);
    }
  }

  void _returnHiveRecipes(String? category) {
    if (category == 'brunch') {
      categoryRecipes = hiveService.getAllLunchRecipes();
    } else if (category == 'dinner') {
      categoryRecipes = hiveService.getAllDinnerRecipes();
    } else {
      recommendedRecipes = hiveService.getAllRecommendedRecipes();
    }
  }

  void _setAndAddRecipes(String? category, ResponseModel response) {
    if (category == null) {
      recommendedRecipeResponse = RecipeResponseDTO.fromMap(response.payload);

      for (var element in recommendedRecipeResponse!.hits) {
        recommendedRecipes.add(element.recipe);
      }
      hiveService.addAllRecommendedRecipes(recommendedRecipes);
    } else if (category == 'brunch') {
      categoryRecipeResponse = RecipeResponseDTO.fromMap(response.payload);

      categoryRecipes = [];
      for (var hit in categoryRecipeResponse!.hits) {
        categoryRecipes.add(hit.recipe);
      }
      hiveService.addAllLunchRecipes(categoryRecipes);
    } else if (category == 'dinner') {
      categoryRecipeResponse = RecipeResponseDTO.fromMap(response.payload);
      categoryRecipes = [];
      for (var hit in categoryRecipeResponse!.hits) {
        categoryRecipes.add(hit.recipe);
      }
      hiveService.addAllDinnerRecipes(categoryRecipes);
    } else {
      Fluttertoast.showToast(
          msg:
              'Error, something has gone wrong when attempting to get recipes');
    }
  }
}
