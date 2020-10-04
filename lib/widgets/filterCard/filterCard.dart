import 'package:badges/badges.dart';
import 'package:chiedoziedivine/models/CarOwners.dart';
import 'package:chiedoziedivine/models/Filteration.dart';
import 'package:chiedoziedivine/providers/app_state.dart';
import 'package:chiedoziedivine/utils/colors.dart';
import 'package:chiedoziedivine/views/CarOwnersScreen/CarOwnersScreen.dart';
import 'package:chiedoziedivine/widgets/texts/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FilterCardWidget extends StatefulWidget {
  Filteration filteration;

  FilterCardWidget(this.filteration);

  @override
  _FilterCardWidgetState createState() => _FilterCardWidgetState();
}

class _FilterCardWidgetState extends State<FilterCardWidget> {

  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  InkWell(
                      child: Badge(
                    badgeColor: Colors.white,
                    shape: BadgeShape.square,
                    borderRadius: 10,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    badgeContent: Icon(
                      MaterialCommunityIcons.uber,
                      size: 29,
                    ),
                  )),
                  Spacer(),
//                  Icon(MaterialCommunityIcons.alarm, color: AppColors.PRIMARY_COLOR, size: 16,),
                  SizedBox(
                    width: 3,
                  ),
                  BodyText(
                    widget.filteration.startYear.toString() +
                        " - " +
                        widget.filteration.endYear.toString(),
                    textStyle: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 7,
              ),
              widget.filteration.gender == "" ||
                      widget.filteration.gender == null
                  ? BodyBoldText(
                      "GENDER: ALL",
                      textStyle: TextStyle(color: Colors.white),
                    )
                  : BodyBoldText(
                      "GENDER: " + widget.filteration.gender.toUpperCase(),
                      textStyle: TextStyle(color: Colors.white),
                    ),
              BodyText(
                "COUNTRIES:  ",
                textStyle: TextStyle(color: Colors.white, fontSize: 10),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (widget.filteration.countries.isEmpty ||
                      widget.filteration.countries == null)
                    BodyText(
                      "ALL ",
                      textStyle: TextStyle(color: Colors.white, fontSize: 10),
                    )
                  else
                    for (int i = 0;
                        i < widget.filteration.countries.length;
                        i++)
                      BodyText(
                        widget.filteration.countries[i] + " ",
                        textStyle: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                ],
              ),

              SizedBox(
                height: 3,
              ),
              Text(
                "Colors: ",
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (widget.filteration.colors.isEmpty ||
                      widget.filteration.colors == null)
                    Text(
                      "ALL",
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    )
                  else
                    for (int i = 0; i < widget.filteration.colors.length; i++)
                      Text(
                         widget.filteration.colors[i] + " ",
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      )
                ],
              ),
              SizedBox(
                height: 3,
              ),
//              BodyLightText(widget.filteration.bio),
            ],
          ),
          decoration: BoxDecoration(
              color:  Colors.black, borderRadius: BorderRadius.circular(10)),
        ),
        onTap: () {
//          setState(() => isLoading = true);
          Provider.of<AppState>(context).filtrationCarOwnerList(widget.filteration);
//          setState(() => isLoading = false);
          Navigator.pushNamed(context, CarOwnersScreen.routeName);
        });
    // return makeListItem(widget.Visitor);
  }
}
