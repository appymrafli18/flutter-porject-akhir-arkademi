// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddUserController extends GetxController {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController umur = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController avatarUrl = TextEditingController();

  void postToFirebase() async {
    if (firstName.text.isEmpty &&
        lastName.text.isEmpty &&
        email.text.isEmpty &&
        umur.text.isEmpty &&
        weight.text.isEmpty &&
        height.text.isEmpty &&
        avatarUrl.text.isEmpty) return;

    final Uri url = Uri.parse(
        "https://ujian-akhir-arkademi-default-rtdb.asia-southeast1.firebasedatabase.app/user.json");

    try {
      final response = await http.post(url,
          body: jsonEncode({
            "firstName": firstName.text,
            "lastName": lastName.text,
            "email": email.text,
            "umur": int.parse(umur.text),
            "weight": int.parse(weight.text),
            "height": int.parse(height.text),
            "avatarUrl": avatarUrl.text
          }));

      if (response.statusCode != 200) {
        print('Failed to send data. Status code: ${response.statusCode}');
        print('Error: ${response.body}');
      }

      print('Data successfully sent!');
      Get.back();
    } catch (e) {
      print('Failed to send data. Error: $e');
    }
  }
}
