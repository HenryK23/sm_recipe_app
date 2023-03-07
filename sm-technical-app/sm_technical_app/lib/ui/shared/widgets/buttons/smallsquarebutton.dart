import 'package:flutter/material.dart';
import 'package:sm_technical_app/helpers/enums/text_state.dart';
import 'package:sm_technical_app/ui/shared/theme/app_colours.dart';
import 'package:sm_technical_app/ui/shared/theme/app_text.dart';

class SmallSquareButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isSelected;
  const SmallSquareButton(
      {this.onPressed,
      required this.label,
      this.isSelected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected ? AppColours.primary : AppColours.white,
                  width: 2.0),
              color: isSelected ? AppColours.white : AppColours.primary,
              borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: AppText.body(label,
                    state: isSelected
                        ? TextState.link
                        : TextState.onDarkBackground,
                    fontWeight: FontWeight.w600)),
          ),
        ));
  }
}
