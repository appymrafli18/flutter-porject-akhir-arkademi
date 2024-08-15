import 'package:get/get.dart';

import '../modules/addUser/bindings/add_user_binding.dart';
import '../modules/addUser/views/add_user_view.dart';
import '../modules/editUser/bindings/edit_user_binding.dart';
import '../modules/editUser/views/edit_user_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USER,
      page: () => const AddUserView(),
      binding: AddUserBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_USER,
      page: () => EditUserView(index: 0),
      binding: EditUserBinding(),
    ),
  ];
}
