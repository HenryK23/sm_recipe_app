// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:sm_technical_app/domain/dtos/response/meals/recipedto.dart';
import 'package:sm_technical_app/helpers/viewmodel.dart';
import 'package:sm_technical_app/services/hive_service.dart';

part 'list_viewmodel.g.dart';

class ListViewModel = _ListViewModel with _$ListViewModel;

abstract class _ListViewModel extends ViewModel with Store {
  final HiveService hiveService;

  _ListViewModel(this.hiveService);

  @observable
  bool isLoading = false;

  @observable
  List<RecipeDTO> allRecipes = [];

  @observable
  Map<String, Ingredient> allIngredients = {};

  @action
  Future<void> getAllRecipes() async {
    isLoading = true;
    allRecipes.addAll(hiveService.getMealPlanLunchRecipes());
    allRecipes.addAll(hiveService.getMealPlanDinnerRecipes());

    getAllIngredients();
    isLoading = false;
  }

  @action
  void getAllIngredients() {
    for (var element in allRecipes) {
      for (var ingredient in element.ingredients!) {
        if (allIngredients.containsKey(ingredient.food)) {
          allIngredients[ingredient.food!]!.quantity += ingredient.quantity!;
          allIngredients[ingredient.food!]!.measure =
              ingredient.measure ?? 'a bit';
        } else {
          allIngredients[ingredient.food!] = Ingredient(
            quantity: ingredient.quantity!,
            measure: ingredient.measure ?? 'a bit',
          );
        }
      }
    }
  }
}

class Ingredient {
  double quantity;
  String measure;
  Ingredient({
    required this.quantity,
    required this.measure,
  });
}

 // allIngredients[ingredient.food].allIngredients[ingredient.food!] =
          //     '${ingredient.quantity == 0 ? "" : ingredient.quantity?.toStringAsFixed(2)} ${ingredient.measure?.replaceAll('<unit>', 'units') ?? "a bit"}';
