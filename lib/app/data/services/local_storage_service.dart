import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartlock_app/core/errors/failure.dart';

class LocalStorageService extends GetxService {
  // static LocalStorageService get to => Get.find();
  // late SharedPreferences _sharedPreferences;

  // Future<LocalStorageService> init() async {
  //  _sharedPreferences = await SharedPreferences.getInstance();
  //   log(_sharedPreferences.toString(), name: 'LOCAL STORAGE INIT');
  //   return this;
  // }

  Future<dynamic> get({required String key}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final value = sharedPreferences.get(key);
      return value;
    } catch (e) {
      return e;
    }

  }
  Future<dynamic> delete({required String key}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final value = sharedPreferences.remove(key);
      return value;
    } catch (e) {
      return e;
    }
  }

  Future<bool> getBool({required String key}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final bool? value = sharedPreferences.getBool(key);
      return value!;
    } catch (e) {
      log(e.toString());
      throw UnknownError(errorMessage: 'Não foi possível encontrar a chave');
    }
  }

  Future save({required String key, required String value}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(key, value);
    } catch (e) {
      throw UnknownError(errorMessage: 'Não foi possível encontrar a chave');
    }
  }

  Future saveBool({required String key, required bool value}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool(key, value);
    } catch (e) {
      throw UnknownError(errorMessage: 'Não foi possível salvar a chave');
    }
  }

  Future saveMap(
      {required String key, required Map<String, dynamic> map}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(key, map.toString());
    } catch (e) {
      rethrow;
    }
  }
}