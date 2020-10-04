import 'dart:convert';
import 'dart:io';

import 'package:chiedoziedivine/models/CarOwners.dart';
import 'package:chiedoziedivine/models/Filteration.dart';
import 'package:chiedoziedivine/services/apiService.dart';
import 'package:chiedoziedivine/utils/constants.dart';
import 'package:chiedoziedivine/utils/helper.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class AppState with ChangeNotifier {
  ApiService apiService = new ApiService();
  Helper helperClass = new Helper();
  Directory directory;
  String _report;
  List<CarOwners> _allCarOwnersList = [];
  List<CarOwners> _filteredCarOwnersList = [];
  List<Filteration> _filtrationList = [];
  bool isLoading = false;

  String get report => _report;

  List<CarOwners> get allCarOwnersList => _allCarOwnersList;

  List<CarOwners> get filteredCarOwnersList => _filteredCarOwnersList;

  List<Filteration> get filtrationList => _filtrationList;

  AppState() {
    _loadData();
  }

  void _loadData() async {

    directory = await getApplicationDocumentsDirectory();
    var bytes = await apiService.downloadFile();
    if (bytes != null) {
      populateCarOwner();
      await apiService.getFilterations().then((value) {
        _filtrationList = value;
        notifyListeners();
      });
    }
//      helperClass.writeToPath(bytes).then((_) async {
//
//      });

    else
      print("File not found");
  }

  Future populateCarOwner() async {
    try {
      final File file = File(directory.path + Constants.CSV_FILE_PATH);

      Stream<List> inputStream = file.openRead();
      inputStream
          .transform(utf8.decoder) // Decode bytes to UTF-8.
          .transform(new LineSplitter()) // Convert stream to individual lines.
          .listen((String line) {
        // Process results.
        List row = line.split(',');
        _allCarOwnersList.add(CarOwners.fromList(row)); // split by comma
      }, onDone: () {
        print(_allCarOwnersList);
      });
    } catch (e) {
      print(e);
    }
  }

  filtrationCarOwnerList(Filteration filtration) async {
    _filteredCarOwnersList = Helper.filtrationMethod(filtration, _allCarOwnersList);
    notifyListeners();
  }
}
