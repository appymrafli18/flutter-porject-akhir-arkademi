import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:ujian_akhir_flutter_muhammad_rafli/app/modules/home/controllers/home_controller.dart';

import '../controllers/edit_user_controller.dart';

class EditUserView extends GetView<EditUserController> {
  EditUserView({super.key, required this.index});

  final int index;
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstName =
        TextEditingController(text: homeController.users[index]['firstName']);
    final TextEditingController lastName =
        TextEditingController(text: homeController.users[index]['lastName']);
    final TextEditingController email =
        TextEditingController(text: homeController.users[index]['email']);
    final TextEditingController umur = TextEditingController(
        text: homeController.users[index]['umur'].toString());
    final TextEditingController weight = TextEditingController(
        text: homeController.users[index]['weight'].toString());
    final TextEditingController height = TextEditingController(
        text: homeController.users[index]['height'].toString());
    final TextEditingController avatarUrl =
        TextEditingController(text: homeController.users[index]['avatarUrl']);
    return Scaffold(
      appBar: AppBar(
        title: const Text('EDIT PESERTA'),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        // child: Column(
        children: [
          TextField(
            controller: firstName,
            decoration: const InputDecoration(
              labelText: "First Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: lastName,
            decoration: const InputDecoration(
              labelText: "Last Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: umur,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: "Umur",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: weight,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: "Weight (kg)",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: height,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: "Height (cm)",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: avatarUrl,
            decoration: const InputDecoration(
              labelText: "Avatar (url)",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              onPressed: () {
                controller.editToFirebase();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: const Text(
                "EDIT",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
        // ),
      ),
    );
  }
}
