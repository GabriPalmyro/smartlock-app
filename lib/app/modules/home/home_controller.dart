import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/blocks/pages/blocks_page.dart';
import 'package:smartlock_app/app/modules/home/pages/home_page.dart';
import 'package:smartlock_app/app/modules/user-settings/user_settings_view.dart';

class HomeController extends GetxController {
  final RxInt _selectedIndex = 0.obs;

  final List<Widget> widgetOptions = [
    HomePage(),
    const BlocksPage(),
    HomePage(),
     UserSettingsView(),
  ];

  int get selectedIndex => _selectedIndex.value;

  void onItemTapped(int index) {
    _selectedIndex.value = index;
  }
}
