import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sm_technical_app/domain/dtos/response/meals/recipedto.dart';
import 'package:sm_technical_app/helpers/viewmodel.dart';
import 'package:sm_technical_app/services/hive_service.dart';

part 'plan_viewmodel.g.dart';

class PlanViewModel = _PlanViewModel with _$PlanViewModel;

abstract class _PlanViewModel extends ViewModel with Store {
  final HiveService hiveService;

  _PlanViewModel(this.hiveService);

  @observable
  PageController pageController = PageController();

  @observable
  List<RecipeDTO> lunchRecipes = [];

  @observable
  List<RecipeDTO> dinnerRecipes = [];

  @observable
  int selectedDayIndex = 0;

  @observable
  bool isLoading = false;

  @observable
  List<String> encodedImages = [];

  @observable
  List<Uint8List> lunchImages = [];

  @action
  Future<void> getWeeklyRecipes() async {
    isLoading = true;
    lunchRecipes = hiveService.getMealPlanLunchRecipes();
    dinnerRecipes = hiveService.getMealPlanDinnerRecipes();
    isLoading = false;
  }
}
