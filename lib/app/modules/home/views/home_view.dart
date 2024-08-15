import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ujian_akhir_flutter_muhammad_rafli/app/modules/addUser/views/add_user_view.dart';
import 'package:ujian_akhir_flutter_muhammad_rafli/app/modules/editUser/views/edit_user_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("REBUILD");
    controller.firebaseToList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALL USERS'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle:
            const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const AddUserView());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Obx(() {
          if (controller.users.isEmpty) {
            return const Text("No Data");
          } else {
            return ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => EditUserView(index: index));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Card(
                        child: ListTile(
                          leading: FittedBox(
                              child: CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(user['avatarUrl']),
                          )),
                          title:
                              Text("${user['firstName']} ${user['lastName']}"),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user['email']),
                              Text("${user['umur']} tahun"),
                              Text("${user['weight']} kg"),
                              Text("${user['height']} cm"),
                            ],
                          ),
                          trailing: Container(
                            width: 40,
                            height: 40,
                            color: Colors.transparent,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete)),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
        }),
      ),
    );
  }
}
