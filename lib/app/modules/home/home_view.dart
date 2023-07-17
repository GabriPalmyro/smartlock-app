import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';
import 'package:smartlock_app/app/modules/home/widgets/header_teacher_home.dart';
import 'package:smartlock_app/app/widgets/navigators/bottom_navigator_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.background,
      body: Stack(
        children: [
          Column(
            children: [HeaderTeacherHome()],
          ),
          const Positioned(bottom:70, child:  BottomNavigatorWidget())
        ],
      ),
    );
  }
}
