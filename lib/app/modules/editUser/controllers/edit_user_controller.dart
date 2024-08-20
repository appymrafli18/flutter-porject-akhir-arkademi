// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:ujian_akhir_flutter_muhammad_rafli/app/modules/home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;

class EditUserController extends GetxController {
  // dynamic searchIndex;
  // final HomeController homeController = Get.find<HomeController>();
  dynamic DataUpdated = Get.find<HomeController>().users;
  String valueKey = "";

  void editToFirebase(
      {firstName,
      lastName,
      email,
      umur,
      weight,
      height,
      avatarUrl,
      index}) async {
    DataUpdated[index]["firstName"] = firstName;
    DataUpdated[index]["lastName"] = lastName;
    DataUpdated[index]["email"] = email;
    DataUpdated[index]["umur"] = umur;
    DataUpdated[index]["weight"] = weight;
    DataUpdated[index]["height"] = height;
    DataUpdated[index]["avatarUrl"] = avatarUrl;

    // await http.put(url, body: {DataUpdated});
    final Uri url = Uri.parse(
        "https://ujian-akhir-arkademi-default-rtdb.asia-southeast1.firebasedatabase.app/user/${DataUpdated[index]['id']}.json");

    print(firstName);

    await http.patch(url, body: jsonEncode(DataUpdated[index]));

    DataUpdated.refresh();
    Get.back();
  }
}
