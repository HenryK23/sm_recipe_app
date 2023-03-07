import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_pages/create_plan_page.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_pages/cuisine_page.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_pages/diet_plan_page.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_pages/exclude_food_page.dart';
import 'package:sm_technical_app/ui/pages/create/create_stepper/create_stepper_viewmodel.dart';
import 'package:sm_technical_app/ui/shared/theme/app_colours.dart';

import '../../../../helpers/viewmodelroot.dart';

class CreatePlanStepper extends StatelessWidget {
  final CreateStepperViewModel viewModel;

  const CreatePlanStepper(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    var pages = [
      DietPlanPage(viewModel),
      ExcludeFoodPage(viewModel),
      CuisinePage(viewModel),
      CreatePlanPage(viewModel)
    ];
    return Scaffold(
      backgroundColor: AppColours.white,
      body: ViewModelRoot(
          viewModel: viewModel,
          child: SafeArea(
            child: Observer(
                builder: (context) => PageView(
                    controller: viewModel.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: pages)),
          )),
    );
  }
}
