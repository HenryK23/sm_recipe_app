import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_colours.dart';

class SquaredFlatButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final Color backgroundColor;
  final double height;
  final double width;
  final Gradient? gradient;
  final Icon? icon;
  final bool centeredIcon;

  const SquaredFlatButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = AppColours.primary,
      this.backgroundColor = AppColours.white,
      this.height = 40.0,
      this.width = double.infinity,
      this.gradient,
      this.icon,
      this.centeredIcon = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
                side: BorderSide(color: color))),
        child: Row(
          mainAxisAlignment: icon == null || centeredIcon
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            if (centeredIcon && icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: icon!,
              ),
            Text(text,
                textAlign: icon == null ? TextAlign.center : TextAlign.start,
                style: GoogleFonts.sourceSansPro(
                    color: color, fontSize: 16.0, fontWeight: FontWeight.w600)),
            if (icon != null && !centeredIcon) icon!,
          ],
        ),
      ),
    );
  }
}
