import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/blocks/pages/blocks_page.dart';
import 'package:smartlock_app/app/modules/home/pages/home_page.dart';

class HomeController extends GetxController {
  final RxInt _selectedIndex = 0.obs;

  final List<Widget> widgetOptions = [
    HomePage(),
    const BlocksPage(),
    HomePage(),
    HomePage(),
  ];

  int get selectedIndex => _selectedIndex.value;

  void onItemTapped(int index) {
    _selectedIndex.value = index;
  }
}
