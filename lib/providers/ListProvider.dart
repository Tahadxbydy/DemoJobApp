import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demoapp/Models/ListModel..dart';
import 'package:flutter/material.dart';

import '../Constants/ApiConstants.dart';
import '../Utils/SnackBars.dart';

class ListProvider extends ChangeNotifier {
  List<ListModel> _listOfData = [];
  List<ListModel> get listOfData => _listOfData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchList(BuildContext context) async {
    // _isLoading = true;
    // notifyListeners();
    // Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final Uri url = Uri.parse(ApiConstants.photos);
      final response = await http.get(
        url,
        // headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        for (final i in jsonResponse) {
          _listOfData.add(ListModel.fromJson(i));
        }

        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        errorSnackbar(context,
            'Error fetching data status Coded: ${response.statusCode}');
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      errorSnackbar(context, 'Error fetching data$e');
    }
  }
}
