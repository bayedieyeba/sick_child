import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sick_child/model/enfant.model.dart';


Future<http.Response?> register(Enfant data) async {
  http.Response? response;
  try {
    response =
    await http.post(
        Uri.parse("http://10.0.2.2:8083/api/enfants/"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data.toJson()));
  } catch (e) {
    log(e.toString());
  }
  return response;
}