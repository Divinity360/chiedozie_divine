import 'package:chiedoziedivine/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle defaultHeadingStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 20,
  color: AppColors.DARK,
);

TextStyle defaultSubHeadingStyle =
    TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: AppColors.DARK);

TextStyle defaultBodyStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: AppColors.DARK);

TextStyle defaultBodyLightStyle =
    TextStyle(fontSize: 13, color: AppColors.DARK);

TextStyle defaultBodyHighLightStyle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  color: AppColors.DARK,
);

TextStyle defaultBodyBoldStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: AppColors.DARK,
);

TextStyle defaultButtonStyle =
    TextStyle(fontSize: 11, fontWeight: FontWeight.w300);

@immutable
class SubHeadingText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const SubHeadingText(this.text,
      {this.textStyle, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(fontWeight: FontWeight.w600).merge(defaultSubHeadingStyle).merge(textStyle),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const BodyText(this.text, {this.textStyle, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins().merge(defaultBodyStyle).merge(textStyle),
    );
  }
}

@immutable
class HeadingText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const HeadingText(this.text,
      {this.textStyle, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(fontWeight: FontWeight.w500, letterSpacing: 0.3)
          .merge(defaultHeadingStyle)
          .merge(textStyle),
    );
  }
}

@immutable
class BodyBoldText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const BodyBoldText(this.text,
      {this.textStyle, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style:
          GoogleFonts.poppins(fontWeight: FontWeight.bold)
              .merge(defaultBodyBoldStyle)
              .merge(textStyle),
    );
  }
}

@immutable
class BodyLightText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const BodyLightText(this.text,
      {this.textStyle, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(fontWeight: FontWeight.w200).merge(defaultBodyLightStyle).merge(textStyle),
    );
  }
}

@immutable
class BodyHighlightText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const BodyHighlightText(this.text,
      {this.textStyle, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins().merge(defaultBodyHighLightStyle).merge(textStyle),
    );
  }
}

@immutable
class ButtonText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const ButtonText(this.text, {this.textStyle, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins().merge(defaultButtonStyle).merge(textStyle),
    );
  }
}
