// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final Uri url = Uri.parse(
      "https://ujian-akhir-arkademi-default-rtdb.asia-southeast1.firebasedatabase.app/user.json");

  RxList<Map<String, dynamic>> users = <Map<String, dynamic>>[].obs;

  void firebaseToList() async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      print('Failed to show data. Status code: ${response.statusCode}');
      print('Error: ${response.body}');
    }

    dynamic decodedResponse = jsonDecode(response.body);

    print(decodedResponse.runtimeType);
    print(decodedResponse);

    if (decodedResponse is Map) {
      final Map<String, dynamic> mapData =
          decodedResponse as Map<String, dynamic>;

      final List<Map<String, dynamic>> userList = mapData.entries.map((entry) {
        return {'id': entry.key, ...entry.value as Map<String, dynamic>};
      }).toList();

      users.value = userList;
    } else {
      print('Data tidak dalam format yang diharapkan');
    }
  }
}

    // if (decodedResponse == null) {
    // print("No Data");
    // } else {
    // final List<Map<String, dynamic>> userMapping =
    // decodedResponse.map((e) => e as Map<String, dynamic>).toList();

    // users.addAll(userMapping);
    // }

    // users.refresh();