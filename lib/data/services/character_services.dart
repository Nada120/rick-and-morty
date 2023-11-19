import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../shared/constant/baseurl.dart';

class CharacterServices {
  final dio = Dio();

  Future<List<dynamic>> getAllCharacters() async {
    try {
      var response = await dio.get('$baseUrl/character');
      return response.data['results'];
    } catch (e) {
      debugPrint('The Error is: $e');
      return [];
    }
  }
}
