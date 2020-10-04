import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:chiedoziedivine/providers/app_state.dart';
import 'package:chiedoziedivine/utils/colors.dart';
import 'package:chiedoziedivine/views/CarOwnersScreen/CarOwnersScreen.dart';
import 'package:chiedoziedivine/widgets/carOwnerCard/carOwnerCard.dart';
import 'package:chiedoziedivine/widgets/filterCard/filterCard.dart';
import 'package:chiedoziedivine/widgets/texts/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/FilterScreen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
//  SharedPreferences preferences;
//  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  AppState _appState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: AppColors.OUTLINE_FADED,
      body:   _appState.filtrationList.length > 0 ?  new SingleChildScrollView(
        child: new Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    child: Badge(
                      badgeContent: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                      badgeColor: AppColors.DARK,
                      shape: BadgeShape.square,
                      borderRadius: 4,
                    ), onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CarOwnersScreen())),
                  )
                  ,
                  SizedBox(
                    width: 15,
                  ),
                  HeadingText(
                    "My Filters",
                    textStyle: TextStyle(fontSize: 22),
                  ),
                ],
              ),
              new SizedBox(
                height: 50,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: _appState.filtrationList.length,
                itemBuilder: (BuildContext context, int index) =>
                    FilterCardWidget(
                      _appState.filtrationList[index]
                    ),
              )])
          ),
        )  : Center(child: Column
        (
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LoadingBouncingLine.circle(backgroundColor: AppColors.PRIMARY_COLOR,),
          BodyLightText("Fetching resources from server.")
        ],
      )),
    );
  }
}
