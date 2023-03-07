import 'package:flutter/material.dart';

import '../../theme/app_colours.dart';
import '../../theme/app_text.dart';

class ToggleContainerButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onPressed;
  final String text;
  const ToggleContainerButton({
    super.key,
    required this.isSelected,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(
                  color: Colors.black,
                  width: 2,
                )
              : null,
          color: !isSelected ? AppColours.red : Colors.green[300],
        ),
        child: Center(child: AppText.body(text, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
