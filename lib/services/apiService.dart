import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:chiedoziedivine/models/Filteration.dart';
import 'package:chiedoziedivine/utils/constants.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  Future<Uint8List> downloadFile() async {
    HttpClient httpClient = new HttpClient();
    Uint8List data;
    var response;

    try {
      var request = await httpClient.getUrl(Uri.parse(Constants.CSV_URL));
      response = await request.close();
      if (response.statusCode == 200) {
        data = await consolidateHttpClientResponseBytes(response);
      } else {
        print(response.statusCode);
        data = null;
      }
    } catch (ex) {
      print(ex);
      data = null;
    }

    return data;
  }

  Future<List<Filteration>> getFilterations() async {
    final response = await http.get(Constants.API_URL);

    List<dynamic> apiResponse = json.decode(response.body);

    return  apiResponse.map<Filteration>((json) {
      return Filteration.fromJson(json);
    }).toList();

//    return filterationList;
  }
}
