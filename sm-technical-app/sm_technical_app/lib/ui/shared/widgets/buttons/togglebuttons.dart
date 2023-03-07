import 'package:flutter/material.dart';

class CustomToggleButtons extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback? onPressed;
  const CustomToggleButtons({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.black : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Center(
            child: Text(text,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600))),
      ),
    );
  }
}
