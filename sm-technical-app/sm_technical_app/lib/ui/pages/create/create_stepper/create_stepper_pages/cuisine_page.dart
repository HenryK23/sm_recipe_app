import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_viewmodel.dart';
import 'package:sm_technical_app/ui/shared/widgets/buttons/squareflatbutton.dart';

import '../../../../shared/theme/app_colours.dart';
import '../../../../shared/theme/app_text.dart';
import '../../../../shared/widgets/buttons/togglecontainerbutton.dart';

class CuisinePage extends StatelessWidget {
  final CreateStepperViewModel viewModel;
  const CuisinePage(this.viewModel, {super.key});

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
                      children: [
                        AppText.headline('Any specific cuisines'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ToggleContainerButton(
                                  onPressed: () =>
                                      viewModel.toggleCuisine('italian'),
                                  text: 'Italian',
                                  isSelected:
                                      viewModel.isCuisineSelected('italian'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ToggleContainerButton(
                                  onPressed: () =>
                                      viewModel.toggleCuisine('mexican'),
                                  text: 'Mexican',
                                  isSelected:
                                      viewModel.isCuisineSelected('mexican'),
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
                                    viewModel.toggleCuisine('chinese'),
                                text: 'Chinese',
                                isSelected:
                                    viewModel.isCuisineSelected('chinese'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ToggleContainerButton(
                                onPressed: () =>
                                    viewModel.toggleCuisine('indian'),
                                text: 'Indian',
                                isSelected:
                                    viewModel.isCuisineSelected('indian'),
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
