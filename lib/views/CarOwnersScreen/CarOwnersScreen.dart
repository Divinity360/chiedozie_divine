import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:chiedoziedivine/providers/app_state.dart';
import 'package:chiedoziedivine/utils/colors.dart';
import 'package:chiedoziedivine/widgets/appBar/appBar.dart';
import 'package:chiedoziedivine/widgets/carOwnerCard/carOwnerCard.dart';
import 'package:chiedoziedivine/widgets/texts/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarOwnersScreen extends StatefulWidget {
  static const routeName = '/CarOwners';

  @override
  _CarOwnersScreenState createState() => _CarOwnersScreenState();
}

class _CarOwnersScreenState extends State<CarOwnersScreen> {
//  SharedPreferences preferences;
//  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  AppState appState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: AppColors.OUTLINE_FADED,
      appBar: BaseAppBar(
          title: Text(
            "Car Owners",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
              color: Colors.black
            ),
          ),
          appBar: AppBar()),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right:10, top: 50),
        child: appState.filteredCarOwnersList.isEmpty ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesome.ban, size: 78, color: AppColors.PRIMARY_COLOR,),
              HeadingText("No Car Owner found.")
            ],
          ),
        )  : ListView.builder(
          shrinkWrap: true,
          physics:  AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: appState.filteredCarOwnersList.length,
          itemBuilder: (BuildContext context, int index) =>
              CarOwnerCardWidget(appState.filteredCarOwnersList[index]),
        ),
      )
    );
  }
}
