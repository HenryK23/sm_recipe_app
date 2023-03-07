import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sm_technical_app/domain/models/api/response_model.dart';
import 'package:sm_technical_app/services/hive_service.dart';
import 'package:sm_technical_app/services/meal_service.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_viewmodel.dart';

class MockMealService extends Mock implements MealService {}

class MockHiveService extends Mock implements HiveService {}

void main() {
  late CreateStepperViewModel sut; // System Under Test
  late MockMealService mockMealService;
  late MockHiveService mockHiveService;

  setUp(() {
    mockMealService = MockMealService();
    mockHiveService = MockHiveService();
    sut = CreateStepperViewModel(mockMealService, mockHiveService);
  });

  final recipeResponseFromService = ResponseModel(
    {
      'from': 0,
      'to': 4,
      'count': 4,
      'hits': [
        {
          'recipe': {
            'uri': 'http://www.edamam.com/ontologies/edamam.owl#recipe_1',
            'label': 'Recipe 1',
            'ingredients': [
              {
                'text': '1 cup of rice',
                'weight': 200.0,
              },
              {
                'text': '1 cup of beans',
                'weight': 200.0,
              },
            ],
          },
        },
        {
          'recipe': {
            'uri': 'http://www.edamam.com/ontologies/edamam.owl#recipe_1',
            'label': 'Recipe 1',
            'ingredients': [
              {
                'text': '1 cup of rice',
                'weight': 200.0,
              },
              {
                'text': '1 cup of beans',
                'weight': 200.0,
              },
            ],
          },
        },
        {
          'recipe': {
            'uri': 'http://www.edamam.com/ontologies/edamam.owl#recipe_1',
            'label': 'Recipe 1',
            'ingredients': [
              {
                'text': '1 cup of rice',
                'weight': 200.0,
              },
              {
                'text': '1 cup of beans',
                'weight': 200.0,
              },
            ],
          },
        },
        {
          'recipe': {
            'uri': 'http://www.edamam.com/ontologies/edamam.owl#recipe_1',
            'label': 'Recipe 1',
            'ingredients': [
              {
                'text': '1 cup of rice',
                'weight': 200.0,
              },
              {
                'text': '1 cup of beans',
                'weight': 200.0,
              },
            ],
          },
        },
        {
          'recipe': {
            'uri': 'http://www.edamam.com/ontologies/edamam.owl#recipe_1',
            'label': 'Recipe 1',
            'ingredients': [
              {
                'text': '1 cup of rice',
                'weight': 200.0,
              },
              {
                'text': '1 cup of beans',
                'weight': 200.0,
              },
            ],
          },
        }
      ]
    },
    true,
  );

  final recipeResponseFromServiceWithLowCount = ResponseModel(
    {
      'from': 0,
      'to': 1,
      'count': 1,
      'hits': [
        {
          'recipe': {
            'uri': 'http://www.edamam.com/ontologies/edamam.owl#recipe_1',
            'label': 'Recipe 1',
            'ingredients': [
              {
                'text': '1 cup of rice',
                'weight': 200.0,
              },
              {
                'text': '1 cup of beans',
                'weight': 200.0,
              },
            ],
          },
        },
        {
          'recipe': {
            'uri': 'http://www.edamam.com/ontologies/edamam.owl#recipe_1',
            'label': 'Recipe 1',
            'ingredients': [
              {
                'text': '1 cup of rice',
                'weight': 200.0,
              },
              {
                'text': '1 cup of beans',
                'weight': 200.0,
              },
            ],
          },
        }
      ]
    },
    true,
  );

  group('toggle selected diet plan', () {
    test(
      'Test that when selected diet plan is null, it is set to the value passed in',
      () {
        sut.toggleDietPreference('vegan');
        expect(sut.excludeFood, ['vegan']);
        expect(sut.selectedDietPlan, 'vegan');
      },
    );

    test(
      'Test that when selected diet plan is not null, it is set to null',
      () {
        sut.excludeFood.add('vegan');
        sut.toggleDietPreference('vegan');
        expect(sut.selectedDietPlan, null);
        expect(sut.excludeFood, []);
      },
    );

    test(
      'Test that when another diet plan is selected, it is set to the value passed in',
      () {
        sut.excludeFood.add('vegan');
        sut.toggleDietPreference('vegetarian');
        expect(sut.selectedDietPlan, 'vegetarian');
        expect(sut.excludeFood, ['vegetarian']);
      },
    );
  });

  group(
      'Test that when toggleCuisine is run that it is correctly adding or removing cuisines',
      () {
    test(
      'Test that when the cuisine is not in the list, it is added',
      () {
        sut.toggleCuisine('african');
        expect(sut.selectedCuisines, ['african']);
      },
    );
    test(
      'Test that when the cuisine is in the list, it is removed',
      () {
        sut.selectedCuisines.add('african');
        sut.toggleCuisine('african');
        expect(sut.selectedCuisines, []);
      },
    );

    test('Test that multiple cuisines can be added and removed', () {
      sut.toggleCuisine('african');
      sut.toggleCuisine('american');
      sut.toggleCuisine('african');
      expect(sut.selectedCuisines, ['american']);
    });

    test('Test that multiple cuisines can be added and removed', () {
      sut.toggleCuisine('african');
      sut.toggleCuisine('american');
      sut.toggleCuisine('african');
      sut.toggleCuisine('american');
      expect(sut.selectedCuisines, []);
    });

    test('Test that multipe can be added', () {
      sut.toggleCuisine('african');
      sut.toggleCuisine('american');
      expect(sut.selectedCuisines, ['african', 'american']);
    });
  });

  group('Test that isFoodExcluded method is correctly returning', () {
    test(
      'Test that when the food is not excluded, false is returned',
      () {
        expect(sut.isFoodExcluded('vegan'), false);
      },
    );

    test(
      'Test that when the food is excluded, true is returned',
      () {
        sut.excludeFood.add('vegan');
        expect(sut.isFoodExcluded('vegan'), true);
      },
    );
  });

  group('Test that isCuisineSelected method is correctly returning', () {
    test(
      'Test that when the cuisine is not selected, false is returned',
      () {
        expect(sut.isCuisineSelected('african'), false);
      },
    );

    test(
      'Test that when the cuisine is selected, true is returned',
      () {
        sut.selectedCuisines.add('african');
        expect(sut.isCuisineSelected('african'), true);
      },
    );
  });

  group('Test that getWeeklyLunches is working', () {
    void arrangeMealServiceReturnsARecipeResponse() {
      when(() => mockMealService
          .getMealPlanLunches(
              selectedCuisines: [], excludedFoods: [])).thenAnswer(
          (_) async => Future<ResponseModel>.value(recipeResponseFromService));
    }

    void arrangeMealServiceReturnsLowRecipeResponse() {
      when(() => mockMealService
          .getMealPlanLunches(
              selectedCuisines: [], excludedFoods: [])).thenAnswer((_) async =>
          Future<ResponseModel>.value(recipeResponseFromServiceWithLowCount));
    }

    test(
        'Test that meal service is returning a value and hive service is being run',
        () async {
      arrangeMealServiceReturnsARecipeResponse();
      await sut.getWeeklyLunches();
      expect(sut.lunchRecipes, isNotEmpty);
      verify(() => sut.hiveService.addMealPlanLunchRecipes(any())).called(1);
    });

    test('Test when isSuccess is false when getting weekly lunches', () async {
      when(() => mockMealService
              .getMealPlanLunches(selectedCuisines: [], excludedFoods: []))
          .thenAnswer((_) async => Future<ResponseModel>.value(ResponseModel(
                "error",
                false,
              )));
      await sut.getWeeklyLunches();
      expect(sut.lunchRecipes, []);
      verifyNever(() => sut.hiveService.addMealPlanLunchRecipes(any()));
    });

    test('Test when api returns a low recipe amount', () async {
      arrangeMealServiceReturnsLowRecipeResponse();
      await sut.getWeeklyLunches();
      expect(sut.lunchRecipes, []);
      verifyNever(() => sut.hiveService.addMealPlanLunchRecipes(any()));
    });
  });

  test(
    'Test that all initial values are correct',
    () {
      expect(sut.pageController, isNotNull);
      expect(sut.pageIndex, 0);
      expect(sut.isGenerating, false);
      expect(sut.isLoading, false);
      expect(sut.excludeFood, []);
      expect(sut.selectedCuisines, []);
      expect(sut.lunchResponsedto, null);
      expect(sut.selectedDietPlan, null);
      expect(sut.dinnerResponsedto, null);
      expect(sut.lunchRecipes, []);
      expect(sut.dinnerRecipes, []);
    },
  );
}
