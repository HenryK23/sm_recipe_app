import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_technical_app/domain/constants/routes.dart';
import 'package:sm_technical_app/helpers/viewmodelroot.dart';
import 'package:sm_technical_app/ui/pages/list/list_viewmodel.dart';
import 'package:sm_technical_app/ui/shared/theme/app_text.dart';
import 'package:sm_technical_app/ui/shared/widgets/buttons/squareflatbutton.dart';

class ListPage extends StatelessWidget {
  final ListViewModel viewModel;
  const ListPage(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    viewModel.getAllRecipes();

    return Scaffold(
        body: ViewModelRoot(
            viewModel: viewModel,
            child: Observer(builder: (_) {
              return viewModel.isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: AppText.headline('List'),
                        ),
                        if (viewModel.allIngredients.isEmpty) ...[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: AppText.subtitle(
                                'Theres no ingredients to show, Please navigate to the create page to generate your own meal plan.'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 20.0),
                            child: SquaredFlatButton(
                                text: 'Create Page',
                                onPressed: () =>
                                    context.goNamed(Routes.create.name)),
                          )
                        ],
                        if (viewModel.allIngredients.isNotEmpty) ...[
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: viewModel.allIngredients.length,
                              itemBuilder: (context, index) {
                                String key = viewModel.allIngredients.keys
                                    .elementAt(index);
                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: AppText.subtitle(key)),
                                      SizedBox(
                                        child: AppText.body(
                                            '${viewModel.allIngredients[key]!.quantity == 0 ? "" : viewModel.allIngredients[key]!.quantity.toStringAsFixed(2)} ${viewModel.allIngredients[key]!.measure.replaceAll('<unit>', 'units')}'),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ]
                      ],
                    );
            })));
  }
}
