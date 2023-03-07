import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_technical_app/domain/constants/routes.dart';
import 'package:sm_technical_app/helpers/enums/text_state.dart';
import 'package:sm_technical_app/helpers/stringextension.dart';
import 'package:sm_technical_app/helpers/viewmodelroot.dart';
import 'package:sm_technical_app/ui/pages/explore/explore_viewmodel.dart';
import 'package:sm_technical_app/ui/shared/theme/app_colours.dart';
import 'package:sm_technical_app/ui/shared/theme/app_text.dart';
import 'package:sm_technical_app/ui/shared/widgets/buttons/togglebuttons.dart';

class ExplorePage extends StatelessWidget {
  final ExploreViewModel viewModel;
  const ExplorePage(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    viewModel.loadRecipes();
    return ViewModelRoot(
      viewModel: viewModel,
      child: Observer(builder: (_) {
        return viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: AppText.headline('Explore'),
                ),
                _recommendedRecipes(context, viewModel),
                _recipesByCategory(context),
              ]);
      }),
    );
  }

  Widget _recipesByCategory(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                child: AppText.headline(
                  'Categories',
                ),
              )),
        ),
        Observer(builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
            child: SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomToggleButtons(
                      isSelected: viewModel.selectedIndex == 0,
                      text: 'Lunch',
                      onPressed: () => viewModel.categoryButtonPressed(0)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: CustomToggleButtons(
                        isSelected: viewModel.selectedIndex == 1,
                        text: 'Dinner',
                        onPressed: () => viewModel.categoryButtonPressed(1)),
                  ),
                ],
              ),
            ),
          );
        }),
        Observer(builder: (_) {
          return viewModel.isLoading
              ? const CircularProgressIndicator()
              : SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.categoryRecipes.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: InkWell(
                        onTap: () {
                          context.goNamed(Routes.exploreRecipe.name,
                              queryParams: {
                                'recipeId': viewModel
                                    .categoryRecipes[index].uri!.getRecipeId
                              });
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(
                                    1, 3), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  viewModel.categoryRecipes[index].image ?? "",
                                  scale: 1),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColours.black.withOpacity(0.5),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AppText.bodyMultiline(
                                    viewModel.categoryRecipes[index].label ??
                                        "no label",
                                    state: TextState.onDarkBackground,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                );
        }),
      ],
    );
  }
}

Widget _recommendedRecipes(BuildContext context, ExploreViewModel viewModel) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: AppText.headline(
                'Recommended',
              ),
            )),
      ),
      Observer(builder: (_) {
        return SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.recommendedRecipes.length,
            itemBuilder: (context, index) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: InkWell(
                onTap: () {
                  context.goNamed(Routes.exploreRecipe.name, queryParams: {
                    'recipeId':
                        viewModel.recommendedRecipes[index].uri!.getRecipeId
                  });
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(1, 3),
                      ),
                    ],
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          viewModel.recommendedRecipes[index].image ?? ""),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColours.black.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText.bodyMultiline(
                            viewModel.recommendedRecipes[index].label ??
                                "no label",
                            state: TextState.onDarkBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
        );
      }),
    ],
  );
}
