
import 'package:chiedoziedivine/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';


class SecondaryButton extends StatelessWidget {

  final Function onTap;
  final Color textColor;
  final Color borderColor;
  final String text;
  final bool loading;

  SecondaryButton({this.onTap, this.text, this.textColor  =  const Color(0xfFFF7F50), this.borderColor  = const Color(0xfFFF7F50), this.loading = false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          child: OutlineButton(
            color: Colors.white,
            child: loading
                ? LoadingBouncingLine.circle(
              size: 34,
              backgroundColor: AppColors.PRIMARY_COLOR,
            )
                :  Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight:
                  FontWeight.w500,
              color: textColor),
            ),
            textColor: textColor,
            onPressed: onTap,
            borderSide: BorderSide(
                color: textColor,
                width: 1,
                style: BorderStyle.solid),
            shape:
            new RoundedRectangleBorder(
                borderRadius:
                BorderRadius
              .circular(12.0)),
          ),
          width: double.infinity,
          height: 60,
        ),
      ) ,
      onTap: onTap,
    );
  }
}