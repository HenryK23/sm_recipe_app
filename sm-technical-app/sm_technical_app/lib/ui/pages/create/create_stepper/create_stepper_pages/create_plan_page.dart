import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_technical_app/domain/constants/routes.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_viewmodel.dart';
import 'package:sm_technical_app/ui/shared/theme/app_text.dart';
import 'package:sm_technical_app/ui/shared/widgets/animation/rocket.dart';
import 'package:sm_technical_app/ui/shared/widgets/buttons/squareflatbutton.dart';

import '../../../../shared/theme/app_colours.dart';

class CreatePlanPage extends StatefulWidget {
  final CreateStepperViewModel viewModel;
  const CreatePlanPage(this.viewModel, {super.key});

  @override
  State<CreatePlanPage> createState() => _CreatePlanPageState();
}

class _CreatePlanPageState extends State<CreatePlanPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    AnimationController animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Observer(builder: (_) {
        return widget.viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: const Center(
                            child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Rocket(),
                    ))
                        .animate(autoPlay: false, controller: animController)
                        .shake(
                            hz: 10,
                            offset: const Offset(2, 1),
                            duration: const Duration(seconds: 1))
                        .then()
                        .move(
                            begin: const Offset(0, 0),
                            end: const Offset(0, -500),
                            duration: const Duration(seconds: 2))
                        .shakeX(duration: const Duration(milliseconds: 200)),
                  ),
                  if (!widget.viewModel.isGenerating) ...[
                    AppText.headline('Your plan:'),
                    AppText.subtitle(
                        'Diet Plan: ${(widget.viewModel.selectedDietPlan ?? 'None')}'),
                    AppText.subtitle(
                        'Excluded Foods: ${widget.viewModel.excludedFoodText}'),
                    AppText.subtitle(
                        'Cuisines: ${widget.viewModel.cuisineText}'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SquaredFlatButton(
                          text: 'Create plan',
                          onPressed: () async {
                            widget.viewModel.isGenerating = true;
                            widget.viewModel.generatePlan();
                            await animController.forward().then((value) {
                              // animController.reset();
                              // widget.viewModel.isGenerating = false;
                              context.goNamed(Routes.plan.name);
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SquaredFlatButton(
                          color: AppColours.red,
                          text: 'Back',
                          onPressed: () => widget.viewModel.navigateBack()),
                    ),
                  ]
                ],
              );
      }),
    );
  }
}
