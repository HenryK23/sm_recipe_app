import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_viewmodel.dart';
import 'package:sm_technical_app/ui/shared/theme/app_colours.dart';
import 'package:sm_technical_app/ui/shared/widgets/buttons/squareflatbutton.dart';

import '../../../../shared/theme/app_text.dart';
import '../../../../shared/widgets/buttons/togglecontainerbutton.dart';

class ExcludeFoodPage extends StatelessWidget {
  final CreateStepperViewModel viewModel;
  const ExcludeFoodPage(this.viewModel, {super.key});

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.headline('Foods to exclude'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ToggleContainerButton(
                                  onPressed: () =>
                                      viewModel.toggleExcludeFood('dairy-free'),
                                  text: 'Dairy',
                                  isSelected:
                                      viewModel.isFoodExcluded('dairy-free'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ToggleContainerButton(
                                  onPressed: () => viewModel
                                      .toggleExcludeFood('gluten-free'),
                                  text: 'Gluten',
                                  isSelected:
                                      viewModel.isFoodExcluded('gluten-free'),
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
                                onPressed: () =>
                                    viewModel.toggleExcludeFood('peanut-free'),
                                text: 'Peanuts',
                                isSelected:
                                    viewModel.isFoodExcluded('peanut-free'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ToggleContainerButton(
                                onPressed: () =>
                                    viewModel.toggleExcludeFood('pork-free'),
                                text: 'Pork',
                                isSelected:
                                    viewModel.isFoodExcluded('pork-free'),
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
                text: 'Back',
                onPressed: () => viewModel.navigateBack()),
          ),
        ],
      ),
    );
  }
}
