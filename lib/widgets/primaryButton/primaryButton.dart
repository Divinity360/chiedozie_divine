
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animations/loading_animations.dart';


class PrimaryButton extends StatelessWidget {

  final Function onTap;
  final String text;
  final bool loading;
  final Color textColor;
  final Color buttonColor;

  PrimaryButton({this.onTap, this.text, this.loading = false,
    this.buttonColor = const Color(0xfFFF7F50), this.textColor = const Color(0xffFFFFFF),});
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 60 ,
        child: ButtonTheme(
          height: 50,
          minWidth: double.infinity,
          child: RaisedButton(
            color: buttonColor,
            elevation: 0,
            child: loading
                ? LoadingBouncingLine.circle(
              size: 34,
              backgroundColor: Colors.white,
            )
                : Text(
              text,
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),

            ),
            textColor: textColor,
            onPressed: onTap,
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        )
    );
  }
}