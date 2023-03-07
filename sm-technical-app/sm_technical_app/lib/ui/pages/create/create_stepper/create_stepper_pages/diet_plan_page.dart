import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_viewmodel.dart';
import 'package:sm_technical_app/ui/shared/theme/app_colours.dart';
import 'package:sm_technical_app/ui/shared/theme/app_text.dart';
import 'package:sm_technical_app/ui/shared/widgets/buttons/squareflatbutton.dart';

import '../../../../../domain/constants/routes.dart';
import '../../../../shared/widgets/buttons/togglecontainerbutton.dart';

class DietPlanPage extends StatelessWidget {
  final CreateStepperViewModel viewModel;
  const DietPlanPage(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Observer(builder: (context) {
            return viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText.headline('Any type of diet to follow'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ToggleContainerButton(
                                  onPressed: () => viewModel
                                      .toggleDietPreference('keto-friendly'),
                                  text: 'Keto',
                                  isSelected:
                                      viewModel.isFoodExcluded('keto-friendly'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ToggleContainerButton(
                                  onPressed: () =>
                                      viewModel.toggleDietPreference('vegan'),
                                  text: 'Vegan',
                                  isSelected: viewModel.isFoodExcluded('vegan'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ToggleContainerButton(
                                onPressed: () => viewModel
                                    .toggleDietPreference('pescaetarian'),
                                text: 'Pescaetarian',
                                isSelected:
                                    viewModel.isFoodExcluded('pescaetarian'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ToggleContainerButton(
                                onPressed: () =>
                                    viewModel.toggleDietPreference('kosher'),
                                text: 'Kosher',
                                isSelected: viewModel.isFoodExcluded('kosher'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
          }),
          SquaredFlatButton(
              text: 'Next', onPressed: () => viewModel.navigateForward()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SquaredFlatButton(
                color: AppColours.red,
                text: 'Exit',
                onPressed: () => context.goNamed(Routes.create.name)),
          ),
        ],
      ),
    );
  }
}
