import 'package:dio/dio.dart';
import 'dart:convert';

import '../model/user_model.dart';

// global variables & func
UserModel? currentUser;
final dio = Dio();
const String baseAPI = "https://officemanagement.pdjohn.me/api";

Future<Map<String, dynamic>> login({email, password}) async {
  final formData = FormData.fromMap({
    'email': email,
    'password': password,
    'role_id': 2,
  });
  Response response = await dio.post(
    '$baseAPI/auth/user_login',
    data: formData,
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.data);
    return data;
  } else {
    print('An Error Occurred: ${response.statusCode}');
    return {};
  }
}

Future<Map<String, dynamic>> createUser({email, password}) async {
  final formData = FormData.fromMap({
    'email': email,
    'password': password,
    'role_id': 2,
  });
  Response response = await dio.post(
    '$baseAPI/auth/user_login',
    data: formData,
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.data);
    return data;
  } else {
    print('An Error Occurred: ${response.statusCode}');
    return {};
  }
}

Future<Map<String, dynamic>> getAttendanceList() async {
  final formData = FormData.fromMap({
    'user_id': 22 /* currentUser!.id */, //todo
  });
  Response response = await dio.post(
    '$baseAPI/user/user_timing_list',
    data: formData,
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.data);
    return data;
  } else {
    print('An Error Occurred: ${response.statusCode}');
    return {};
  }
}
