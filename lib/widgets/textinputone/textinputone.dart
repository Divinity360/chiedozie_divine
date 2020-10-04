
import 'package:chiedoziedivine/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputOne extends StatelessWidget{

  TextEditingController controller;
  String hintText = "";
  TextInputType keyboardType = TextInputType.text;
  bool obsureText;
  Function validator;
  int maxLines;
  List<TextInputFormatter> inputFormatter;
  Widget iconView;
  TextInputOne({this.hintText, this.keyboardType = TextInputType.text, this.obsureText = false, this.validator, this.controller, this.inputFormatter, this.maxLines = 1, this.iconView});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        inputFormatters: inputFormatter,
        obscureText: obsureText,

        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color:
                AppColors.DARK),
        decoration: InputDecoration(
          // counter: Offstage(),
          counter: SizedBox(
            height: 0,
          ),

          filled: true,
          suffixIcon: iconView,
          fillColor: Color(0xffF5F5F5),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 10),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 0.5, color: Color(0xffECEDEF)),
              borderRadius: BorderRadius.circular(2)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffECEDEF)),
            borderRadius: BorderRadius.circular(7),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color:
              AppColors.OUTLINE_FADED),
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(width: 0.5, color: AppColors.PRIMARY_COLOR),
              borderRadius: BorderRadius.circular(7)),
        ));
  }
}