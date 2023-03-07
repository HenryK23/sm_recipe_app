import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_technical_app/domain/constants/routes.dart';
import 'package:sm_technical_app/ui/shared/theme/app_text.dart';
import 'package:sm_technical_app/ui/shared/widgets/buttons/squareflatbutton.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: AppText.headline('Create'),
          ),
          AppText.bodyMultiline(
              'Create a plan allows you to create your own custom meal plan for the week. You can choose to exclude certain foods, or choose a diet plan to follow - as well as pick your own cuisines.'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: AppText.bodyMultiline(
                'Once your plan is created a shopping list will automatically be generated for you '),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SquaredFlatButton(
                text: 'Go to create plan',
                onPressed: () => context.goNamed(Routes.createStepper.name)),
          )
        ],
      ),
    ));
  }
}
