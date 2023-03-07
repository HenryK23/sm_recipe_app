import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_technical_app/domain/constants/routes.dart';
import 'package:sm_technical_app/helpers/enums/text_state.dart';
import 'package:sm_technical_app/helpers/stringextension.dart';
import 'package:sm_technical_app/ui/pages/plan/plan_viewmodel.dart';
import 'package:sm_technical_app/ui/shared/theme/app_colours.dart';
import 'package:sm_technical_app/ui/shared/theme/app_text.dart';
import 'package:sm_technical_app/ui/shared/widgets/buttons/squareflatbutton.dart';

import '../../shared/widgets/buttons/smallsquarebutton.dart';

class PlanPage extends StatelessWidget {
  final PlanViewModel viewModel;
  const PlanPage(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    viewModel.getWeeklyRecipes();
    return Scaffold(body: Observer(builder: (_) {
      return viewModel.isLoading
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: AppText.headline('Plan'),
                ),
                if (viewModel.dinnerRecipes.isEmpty ||
                    viewModel.lunchRecipes.isEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: AppText.subtitle(
                        'No plan created for this week. Please navigate to the create page to find out how to generate your own meal plan!',
                        maxLines: 3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SquaredFlatButton(
                      text: 'Create Page',
                      onPressed: () => context.goNamed(Routes.create.name),
                    ),
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
                    child: _topNavigationButtons(),
                  ),
                  _lunchRecipes(context),
                  _dinnerRecipes(context)
                ],
              ],
            );
    }));
  }

  Observer _dinnerRecipes(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.subtitle('Dinner', textAlign: TextAlign.left),
          InkWell(
            onTap: () => context.goNamed(Routes.planRecipe.name, queryParams: {
              'recipeId': viewModel
                  .dinnerRecipes[viewModel.selectedDayIndex].uri?.getRecipeId,
            }),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    onError: (exception, stackTrace) =>
                        log('error loading image'),
                    image: CachedNetworkImageProvider(
                        viewModel
                            .dinnerRecipes[viewModel.selectedDayIndex].image!,
                        errorListener: () => log(
                            "error loading image ${viewModel.dinnerRecipes[viewModel.selectedDayIndex].image}")),
                    fit: BoxFit.cover),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppText.bodyMultiline(
                        viewModel
                            .dinnerRecipes[viewModel.selectedDayIndex].label!,
                        state: TextState.onDarkBackground,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Observer _lunchRecipes(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.subtitle('Lunch', textAlign: TextAlign.left),
          InkWell(
            onTap: () => context.goNamed(Routes.planRecipe.name, queryParams: {
              'recipeId': viewModel
                  .lunchRecipes[viewModel.selectedDayIndex].uri?.getRecipeId,
            }),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: AppColours.primary,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    onError: (exception, stackTrace) =>
                        log('error loading image'),
                    image: CachedNetworkImageProvider(
                        viewModel
                            .lunchRecipes[viewModel.selectedDayIndex].image!,
                        errorListener: () => log(
                            "error loading image ${viewModel.lunchRecipes[viewModel.selectedDayIndex].image}")),
                    fit: BoxFit.cover),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppText.bodyMultiline(
                        viewModel
                            .lunchRecipes[viewModel.selectedDayIndex].label!,
                        state: TextState.onDarkBackground,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Row _topNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SmallSquareButton(
            isSelected: viewModel.selectedDayIndex == 0,
            onPressed: () {
              viewModel.selectedDayIndex = 0;
            },
            label: 'Mon',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SmallSquareButton(
            isSelected: viewModel.selectedDayIndex == 1,
            onPressed: () {
              viewModel.selectedDayIndex = 1;
            },
            label: 'Tue',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SmallSquareButton(
            isSelected: viewModel.selectedDayIndex == 2,
            onPressed: () {
              viewModel.selectedDayIndex = 2;
            },
            label: 'Wed',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SmallSquareButton(
            isSelected: viewModel.selectedDayIndex == 3,
            onPressed: () {
              viewModel.selectedDayIndex = 3;
            },
            label: 'Thu',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SmallSquareButton(
            isSelected: viewModel.selectedDayIndex == 4,
            onPressed: () {
              viewModel.selectedDayIndex = 4;
            },
            label: 'Fri',
          ),
        ),
      ],
    );
  }
}
