import 'dart:typed_data';

import 'package:dio/dio.dart';

class LunaApi {
  static final Dio _dio = Dio();
  static void configureDio() {
    // Base del url
    _dio.options.baseUrl = 'https://lunabackend-6929da72a4c1.herokuapp.com/api';
    // _dio.options.baseUrl = 'http://localhost:8080/api';
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } catch (e) {
      throw ('Error en el GET');
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Error en el POST');
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Error en el PUT');
    }
  }

  static Future delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Error en el delete');
    }
  }

  static Future<void> createApply(
      {
        required Uint8List idFileBytes,
        required Uint8List itinFileBytes,
        required Uint8List osha10FileBytes,
        required String nombre,
        required String apellido,
        required String email,
        required String direccion,
        required String telf,
        required String specialty,
        required String ss
      }) async {
    FormData formData = FormData.fromMap({
      "fileId":  MultipartFile.fromBytes(idFileBytes, filename: 'ID'),
      "fileItin": MultipartFile.fromBytes(itinFileBytes, filename: 'Itin'),
      "fileOsha": MultipartFile.fromBytes(osha10FileBytes, filename: 'Osha'),
      "nombre": nombre,
      "apellido": apellido,
      "email": email,
      "direccion": direccion,
      "telf": telf,
      "specialty": specialty,
      "ss": ss,
    });

    try {
      await _dio.post('/apply', data: formData);
    } catch (e) {
      // print(e);
    }
  }
}
