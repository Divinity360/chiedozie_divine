import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chiedoziedivine/models/CarOwners.dart';
import 'package:chiedoziedivine/models/Filteration.dart';
import 'package:chiedoziedivine/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Helper {
  // Creates new file in path if none is existing and writes data to it
  Future<String> writeToPath(var bytes) async {
    String text;
    final Directory directory = await getApplicationDocumentsDirectory();
    await new File(directory.path + Constants.CSV_FILE_PATH)
        .create()
        .then((_) async {
      final File file = File(directory.path + Constants.CSV_FILE_PATH);
      await file.writeAsBytes(bytes);
      text = "Writing csv to path";
    });
    return text;
  }

  // Reads csv previously stored in device
  Future<String> readCSV(Directory directory) async {
    String text;
    try {
      final File file = File(directory.path + Constants.CSV_FILE_PATH);
      text = await file.readAsString();
      print("text " + text.substring(1030));
    } catch (e) {
      print(e);
    }
    return text;
  }

  //Reads byte response from api service
  Future<String> readResponse(HttpClientResponse response) {
    final completer = Completer<String>();
    final contents = StringBuffer();
    response.transform(utf8.decoder).listen((data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }

  //Filteration Method
  static List<CarOwners> filtrationMethod(
      Filteration filtration, List<CarOwners> _allCarOwnersList) {
    List<CarOwners> _filteredCarOwnersList = [];

    // Filter by year
    _filteredCarOwnersList = _allCarOwnersList
        .where((element) =>
            element.carModelYear >= filtration.startYear &&
            element.carModelYear <= filtration.endYear)
        .toList();
    print("year " + _filteredCarOwnersList.toString());

    //Filter by gender
    _filteredCarOwnersList = filtration.gender == null ||
            filtration.gender == ""
        ? _filteredCarOwnersList
        : _filteredCarOwnersList
            .where((element) =>
                element.gender.toLowerCase() == filtration.gender.toLowerCase())
            .toList();
    print("gender " + _filteredCarOwnersList.toString());

    //Filter by country
    if (filtration.countries.isNotEmpty) {
      List<CarOwners> _filteredCarOwnersByCountry = [];
      for (var country in filtration.countries) {
        _filteredCarOwnersByCountry = _filteredCarOwnersByCountry +
            _filteredCarOwnersList
                .where((element) =>
                    element.country.toLowerCase() == country.toLowerCase())
                .toList();
      }
      _filteredCarOwnersList = _filteredCarOwnersByCountry;
    }

    print("country " + _filteredCarOwnersList.toString());

    //Filter by color
    if (filtration.colors.isNotEmpty) {
      List<CarOwners> _filteredCarOwnersByColor = [];
      for (var color in filtration.colors) {
        _filteredCarOwnersByColor = _filteredCarOwnersByColor +
            _filteredCarOwnersList
                .where((element) =>
                    element.carColor.toLowerCase() == color.toLowerCase())
                .toList();
      }
      _filteredCarOwnersList = _filteredCarOwnersByColor;
    }
    print("color " + _filteredCarOwnersList.toString());

    return _filteredCarOwnersList;
  }
}
