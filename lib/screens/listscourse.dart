import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class ListsCourse extends StatefulWidget {
  const ListsCourse({super.key});

  @override
  State<ListsCourse> createState() => _ListsCourseState();
}

class _ListsCourseState extends State<ListsCourse> {
  List<DataModel> dataList = [];
  bool isLoading = true;
  Future<void> getAllCourses() async {
    Response response;
    var dio = Dio();
    response = await dio.get(
        "https://raploch-furnace.000webhostapp.com/courses/getOperation.php");
    final list = json.decode(response.data) as List<dynamic>;
    dataList = list.map((e) => DataModel.fromJason(e)).toList();
    setState(() {
      if (dataList.isNotEmpty) {
        isLoading = false;
      }
    });
  }

  @override
  void initState() {
    getAllCourses();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getAllCourses();
    });
    return Container(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: DataCard(
                      courseImg: dataList[index].courseImg,
                      courseName: dataList[index].courseName,
                      courseDuration: dataList[index].courseDuration,
                      coursePrice: dataList[index].coursePrice,
                      courseLink: dataList[index].courseLink,
                    ),
                  );
                }));
  }
}

class DataCard extends StatelessWidget {
  // late DataModel dataModel;
  DataCard(
      {required this.courseName,
      required this.courseDuration,
      required this.coursePrice,
      required this.courseImg,
      required this.courseLink});
  String courseName, courseDuration, coursePrice, courseImg, courseLink;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  courseImg,
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Column(
                children: [
                  Text(
                    courseName,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "cours duration: " + courseDuration,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " course Price: " + coursePrice,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse(courseLink));
              },
              child: Text("Enroll now"))
        ],
      ),
    );
  }
}

class DataModel {
  late String id;
  late String courseName;
  late String courseDuration;
  late String coursePrice;
  late String courseImg;
  late String courseLink;
  DataModel.fromJason(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
    courseDuration = json['courseDuration'];

    coursePrice = json['coursePrice'];
    courseImg = json['courseImg'];
    courseLink = json['courseLink'];
  }
}
