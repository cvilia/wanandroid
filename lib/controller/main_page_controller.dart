import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {

  List<BottomNavigationBarItem> bottomNavigationItems() {
    return [BottomNavigationBarItem(icon: Icon(Icons.person))];

  }
}