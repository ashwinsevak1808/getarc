import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getarc/app/view/home/home_controller.dart';

import '../../data/api/api_manager.dart';
import 'home_repository.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.put(HomeController(HomeRepository(ApiManager())));

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("No Data"),
      ),
    );
  }
}
