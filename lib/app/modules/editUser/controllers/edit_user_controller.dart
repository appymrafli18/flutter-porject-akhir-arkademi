import 'package:get/get.dart';

class EditUserController extends GetxController {
  // dynamic searchIndex;
  // final HomeController homeController = Get.find<HomeController>();

  void editToFirebase(
      {firstName, lastName, email, umur, weight, height, avatarUrl}) {
    if (firstName.isNull &&
        lastName.isNull &&
        email.isNull &&
        umur.isNull &&
        weight.isNull &&
        height.isNull &&
        avatarUrl.isNull) {
      print("Not updated");
    }

    

  }
}
