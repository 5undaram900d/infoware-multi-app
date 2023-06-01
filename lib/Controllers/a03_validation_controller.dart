
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationController extends GetxController{
  static ValidationController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final gender = TextEditingController();
  final country = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();

}