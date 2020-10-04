import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:chiedoziedivine/providers/app_state.dart';
import 'package:chiedoziedivine/utils/colors.dart';
import 'package:chiedoziedivine/widgets/carOwnerCard/carOwnerCard.dart';
import 'package:chiedoziedivine/widgets/texts/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
      return  Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: AppColors.OUTLINE_FADED,
        body: new SingleChildScrollView(
          child: new Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    HeadingText(
                      "Car Owners",
                      textStyle: TextStyle(fontSize: 22),
                    ),
                    Badge(
                      badgeContent: Icon(Feather.filter, color: Colors.white,),
                      badgeColor: AppColors.DARK,
                      shape: BadgeShape.square,
                      borderRadius: 4,
                    )
                  ],
                ),
                new SizedBox(
                  height: 50,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: appState.filteredCarOwnersList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CarOwnerCardWidget(
                        appState.filteredCarOwnersList[index]
                      ),
                )
              ],
            ),
          ),
        ),
      );

  }

}
