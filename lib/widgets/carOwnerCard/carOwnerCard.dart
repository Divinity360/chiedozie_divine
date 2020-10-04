import 'package:badges/badges.dart';
import 'package:chiedoziedivine/models/CarOwners.dart';
import 'package:chiedoziedivine/utils/colors.dart';
import 'package:chiedoziedivine/widgets/texts/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CarOwnerCardWidget extends StatefulWidget {
  CarOwners carOwners;

  CarOwnerCardWidget(this.carOwners);

  @override
  _CarOwnerCardWidgetState createState() => _CarOwnerCardWidgetState();
}

class _CarOwnerCardWidgetState extends State<CarOwnerCardWidget> {
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
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage.assetNetwork(
                          placeholder: "images/idmascot.png",
                          image:
                              "https://api.adorable.io/avatars/285/abott@adorable.png",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Spacer(),
                  BodyText(widget.carOwners.carModel +
                      " \u2022" +
                      widget.carOwners.carModelYear.toString() +
                      " \u2022 " +
                      widget.carOwners.carColor)
                ],
              ),
              SizedBox(
                height: 7,
              ),
              SubHeadingText(
                widget.carOwners.firstName + " " + widget.carOwners.lastName,
              ),
              SizedBox(
                height: 3,
              ),
              BodyLightText(widget.carOwners.email),
              SizedBox(
                height: 3,
              ),
              BodyText(widget.carOwners.jobTitle +
                  " \u2022 " +
                  widget.carOwners.country +
                  " \u2022 " +
                  widget.carOwners.gender),
              SizedBox(
                height: 3,
              ),
              BodyLightText(widget.carOwners.bio),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
        ),
        onTap: () {
//          Navigator.pushNamed(context, FeedDetail.routeName,
//              arguments: widget.request);
        });
    // return makeListItem(widget.Visitor);
  }
}
