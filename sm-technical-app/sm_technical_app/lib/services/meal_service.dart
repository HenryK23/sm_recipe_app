// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sm_technical_app/domain/constants/endpointconstants.dart';
import 'package:sm_technical_app/domain/models/api/response_model.dart';
import 'package:sm_technical_app/domain/models/utility/environment.dart';

import 'api_service.dart';

class MealService {
  final ApiService _apiService;
  MealService(
    this._apiService,
  );

  Future<ResponseModel> getRandomMeals({String? mealType}) async {
    var queryParameters = mealType != null
        ? {
            'type': 'any',
            'random': 'true',
            'mealType': mealType.toLowerCase(),
            'app_id': Environment.apiId,
            'app_key': Environment.apiKey,
            'dishType': 'Main Course',
            'calories': '300+'
          }
        : {
            'type': 'any',
            'random': 'true',
            'calories': '300+',
            'q': 'Meat',
            'app_id': Environment.apiId,
            'app_key': Environment.apiKey,
          };
    final response = await _apiService.getRequest(
      EndpointConstants.getRecipes,
      _getHeaders(),
      queryParameters,
    );

    return response.isSuccess
        ? ResponseModel(response.content, response.isSuccess)
        : ResponseModel(response.message, response.isSuccess);
  }

  Future<ResponseModel> getMealPlanLunches(
      {List<String>? excludedFoods, List<String>? selectedCuisines}) async {
    List<String> routeParams = [];
    for (var cuisine in selectedCuisines!) {
      routeParams.add('&cuisineType=$cuisine');
    }
    for (var exclFood in excludedFoods!) {
      routeParams.add('&health=$exclFood');
    }
    var endpoint = EndpointConstants.getRecipes;
    endpoint =
        '$endpoint?type=any&calories=300%2B&random=true&mealType=brunch&dishType=Main%20course&app_id=${Environment.apiId}&app_key=${Environment.apiKey}';

    endpoint = endpoint + routeParams.join();
    final response = await _apiService.getRequest(
        EndpointConstants.getRecipes, _getHeaders(), null, null, endpoint);

    return response.isSuccess
        ? ResponseModel(response.content, response.isSuccess)
        : ResponseModel(response.message, response.isSuccess);
  }

  Future<ResponseModel> getMealPlanDinners(
      {List<String>? excludedFoods, List<String>? selectedCuisines}) async {
    List<String> routeParams = [];
    for (var cuisine in selectedCuisines!) {
      routeParams.add('&cuisineType=$cuisine');
    }
    for (var exclFood in excludedFoods!) {
      routeParams.add('&health=$exclFood');
    }
    var endpoint = EndpointConstants.getRecipes;
    endpoint =
        '$endpoint?type=any&calories=300%2B&random=true&mealType=Dinner&dishType=Main%20course&app_id=${Environment.apiId}&app_key=${Environment.apiKey}';

    endpoint = endpoint + routeParams.join();
    final response = await _apiService.getRequest(
        endpoint, _getHeaders(), null, null, endpoint);

    return response.isSuccess
        ? ResponseModel(response.content, response.isSuccess)
        : ResponseModel(response.message, response.isSuccess);
  }

  Future<ResponseModel> getRecipeById(String id) async {
    var queryParameters = {
      'type': 'public',
      'app_id': Environment.apiId,
      'app_key': Environment.apiKey,
      'dishType': 'Main Course',
    };

    final response = await _apiService.getRequest(
        EndpointConstants.getRecipeById, _getHeaders(), queryParameters, [id]);

    return response.isSuccess
        ? ResponseModel(response.content, response.isSuccess)
        : ResponseModel(response.message, response.isSuccess);
  }

  _getHeaders() => _apiService.getHeaders();
}
