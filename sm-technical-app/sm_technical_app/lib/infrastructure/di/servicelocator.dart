import 'package:sm_technical_app/infrastructure/di/viewmodelfactory.dart';
import 'package:sm_technical_app/services/api_service.dart';
import 'package:sm_technical_app/services/hive_service.dart';
import 'package:sm_technical_app/services/meal_service.dart';

import '../../helpers/startable.dart';

class ServiceLocator implements Startable {
  //Viewmodel factory
  ViewModelFactory? viewModelFactory;

  //Services
  ApiService? apiService;
  HiveService? hiveService;

  MealService? mealService;

  ServiceLocator() {
    apiService = ApiService();
    hiveService = HiveService();
    viewModelFactory = ViewModelFactory(this);

    mealService = MealService(apiService!);
  }

  @override
  Future start() async {}
}
