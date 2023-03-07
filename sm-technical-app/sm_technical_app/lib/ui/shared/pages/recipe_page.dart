import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_technical_app/ui/shared/pages/recipe_viewmodel.dart';
import 'package:sm_technical_app/ui/shared/theme/app_colours.dart';
import 'package:sm_technical_app/ui/shared/widgets/buttons/squareflatbutton.dart';

import '../theme/app_text.dart';
import '../widgets/appbar/customappbar.dart';

class RecipePage extends StatelessWidget {
  final RecipeViewModel viewModel;
  final String recipeId;
  const RecipePage(this.viewModel, this.recipeId, {super.key});

  @override
  Widget build(BuildContext context) {
    viewModel.getRecipeById(recipeId, context);
    return Scaffold(appBar: CustomAppBar(onBackPressed: () {
      GoRouter.of(context).pop();
    }), body: Observer(builder: (_) {
      return viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                viewModel.recipe!.image!),
                            fit: BoxFit.cover))),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 5.0),
                                    child: Icon(
                                      Icons.timer,
                                      color: AppColours.primary,
                                    ),
                                  ),
                                  AppText.body(
                                      '${viewModel.recipe!.totalTime!.toStringAsFixed(0)} minutes'),
                                ],
                              ),
                              AppText.body(
                                  '${(viewModel.recipe!.calories! / viewModel.recipe!.yield!).toStringAsFixed(0)} cals'),
                              AppText.body(
                                  '${viewModel.recipe!.yield!.toStringAsFixed(0)} servings'),
                            ],
                          ),
                          const Divider(
                            color: AppColours.primary,
                            thickness: 1.5,
                          ),
                          AppText.headline(viewModel.recipe!.label!),
                          AppText.subtitle('Ingredients:'),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: viewModel.recipe!.ingredients!.length,
                              itemBuilder: (context, index) {
                                return AppText.body(viewModel
                                    .recipe!.ingredients![index].text!);
                              }),
                          AppText.subtitle('Instructions:'),
                          SquaredFlatButton(
                              text: 'View Instructions',
                              onPressed: () {
                                viewModel.openRecipe();
                              })
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
    }));
  }
}
