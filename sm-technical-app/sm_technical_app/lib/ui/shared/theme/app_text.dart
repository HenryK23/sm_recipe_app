import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sm_technical_app/ui/shared/theme/app_colours.dart';

import '../../../helpers/enums/text_state.dart';

class AppText {
  static const FontWeight _bold = FontWeight.w600;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _regular = FontWeight.w400;

  static Text headline(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 1,
          FontWeight fontWeight = _medium,
          bool isUnderlined = false,
          overflow = TextOverflow.ellipsis}) =>
      _getText(
          content,
          _getOswaldTextStyle(
              fontWeight,
              _getColour(
                state,
              ),
              24),
          textAlign,
          maxLines);

  static Text logo(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 1,
          FontWeight fontWeight = _bold,
          bool isUnderlined = false,
          overflow = TextOverflow.ellipsis}) =>
      _getText(
          content,
          _getOswaldTextStyle(
              fontWeight,
              _getColour(
                state,
              ),
              36),
          textAlign,
          maxLines);

  static Text subtitle(String content,
          {TextState state = TextState.normal,
          TextAlign textAlign = TextAlign.left,
          int maxLines = 1,
          FontWeight fontWeight = _regular,
          bool isUnderlined = false,
          overflow = TextOverflow.ellipsis}) =>
      _getText(
          content,
          _getOswaldTextStyle(
              fontWeight,
              _getColour(
                state,
              ),
              15),
          textAlign,
          maxLines);

  static Text body(
    String content, {
    TextState state = TextState.normal,
    TextAlign textAlign = TextAlign.left,
    int maxLines = 1,
    FontWeight fontWeight = _regular,
  }) =>
      _getText(
          content,
          _getSourceTextStyle(
              fontWeight,
              _getColour(
                state,
              ),
              12),
          textAlign,
          maxLines);

  static Text bodyMultiline(
    String content, {
    TextState state = TextState.normal,
    TextAlign textAlign = TextAlign.left,
    int maxLines = 3,
    FontWeight fontWeight = _regular,
  }) =>
      _getText(
          content,
          _getSourceTextStyle(
              fontWeight,
              _getColour(
                state,
              ),
              12),
          textAlign,
          maxLines);

  static Text _getText(String content, TextStyle textStyle, TextAlign textAlign,
          int maxLines) =>
      Text(
        content,
        style: textStyle,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  static TextStyle _getOswaldTextStyle(
          FontWeight fontWeight, Color color, double size,
          {bool? isUnderline}) =>
      GoogleFonts.oswald(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: isUnderline == true ? TextDecoration.underline : null,
      );

  static TextStyle _getSourceTextStyle(
    FontWeight fontWeight,
    Color color,
    double size,
  ) =>
      GoogleFonts.sourceSansPro(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      );

  static Color _getColour(TextState state) {
    // Get Text Colour
    switch (state) {
      case TextState.normal:
        return AppColours.black;
      case TextState.error:
        return AppColours.red;
      case TextState.onDarkBackground:
        return AppColours.white;
      case TextState.link:
        return AppColours.primary;

      default:
        throw ArgumentError("AppText: Unknown TextState ($state)");
    }
  }
}
