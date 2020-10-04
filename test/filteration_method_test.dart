import 'dart:async';

import 'package:chiedoziedivine/models/CarOwners.dart';
import 'package:chiedoziedivine/models/Filteration.dart';
import 'package:chiedoziedivine/providers/app_state.dart';
import 'package:chiedoziedivine/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  Filteration _filteration;
  List<CarOwners> _carOwnerList;
  StreamController<Filteration> _controller;

  _carOwnerList = [
    CarOwners(
      id: "1",
      gender: "Male",
      bio: " d",
      carColor: "Orange",
      carModel: "Lexus",
      carModelYear: 2003,
      country: "Nigeria",
      email: "thedivinitysoft@gmail.com",
      firstName: "Divinity",
      jobTitle: "Software Developer",
      lastName: "Divinity"
    )
  ];

  test('Return type is instance of CarOwner List', () {
    _filteration = Filteration(
        id: 1,
        colors: ["Orange"],
        countries: ["Nigeria"],
        endYear: 2012,
        startYear: 2000,
        gender: "Male");

    var result = Helper.filtrationMethod(_filteration, _carOwnerList);
    expect(result, isInstanceOf<List<CarOwners>>());
  });

  test('Invalid Colors', () {
    _filteration = Filteration(
        id: 1,
        colors: ["Orange X", "Orange Y", "Orange Z"],
        countries: ["Nigeria"],
        endYear: 2012,
        startYear: 2000,
        gender: "Male");

    var result = Helper.filtrationMethod(_filteration, _carOwnerList);
    expect(result, isEmpty);
  });

  test('Invalid Countries', () {
    _filteration = Filteration(
        id: 1,
        colors: ["Orange"],
        countries: ["Kano", "Lagos", "Maryland"],
        endYear: 2012,
        startYear: 2000,
        gender: "Male");

    var result = Helper.filtrationMethod(_filteration, _carOwnerList);
    expect(result, isEmpty);
  });


  test('Invalid date range', () {
    _filteration = Filteration(
        id: 1,
        colors: ["Orange"],
        countries: ["Nigeria"],
        endYear: 1111,
        startYear: 5555,
        gender: "Male");

    var result = Helper.filtrationMethod(_filteration, _carOwnerList);
    expect(result, isEmpty);
  });

  test('Invalid gender', () {
    _filteration = Filteration(
        id: 1,
        colors: ["Orange"],
        countries: ["Nigeria"],
        endYear: 2012,
        startYear: 2000,
        gender: "Transgender");

    var result = Helper.filtrationMethod(_filteration, _carOwnerList);
    expect(result, isEmpty);
  });

}