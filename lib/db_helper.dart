import 'package:dio/dio.dart';

class DbHelper {
  static Future<String> addCourse(
    courseName,
    courseDuration,
    coursePrice,
    courseImg,
    courseLink,
  ) async {
    var dio = Dio();
    var formData = FormData.fromMap({
      "courseName": courseName,
      "courseDuration": courseDuration,
      "coursePrice": coursePrice,
      "courseImg": courseImg,
      "courseLink": courseLink
    });
    var response = await dio.post(
        "https://raploch-furnace.000webhostapp.com/courses/addOperation.php",
        data: formData);
    return response.toString();
  }

  static Future<String> updateCourse(
    id,
    courseName,
    courseDuration,
    coursePrice,
    courseImg,
    courseLink,
  ) async {
    var dio = Dio();
    var formData = FormData.fromMap({
      "id": id,
      "courseName": courseName,
      "courseDuration": courseDuration,
      "coursePrice": coursePrice,
      "courseImg": courseImg,
      "courseLink": courseLink
    });
    var response = await dio.post(
        "https://raploch-furnace.000webhostapp.com/courses/addOperation.php",
        data: formData);
    return response.toString();
  }
}
