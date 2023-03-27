import 'package:crud_sql_flutter/screens/course_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../db_helper.dart';

class AddCourse_screen extends StatefulWidget {
  const AddCourse_screen({super.key});

  @override
  State<AddCourse_screen> createState() => _AddCourse_screenState();
}

class _AddCourse_screenState extends State<AddCourse_screen> {
  var courseName = "";
  var courseDuration = "";
  var coursePrice = "";
  var courseImg = "";
  var courseLink = "";
  final courseNameController = TextEditingController();
  final courseDurationController = TextEditingController();
  final coursePriceController = TextEditingController();
  final courseImgController = TextEditingController();
  final courseLinkController = TextEditingController();

  @override
  void dispose() {
    courseNameController.dispose();
    courseDurationController.dispose();
    coursePriceController.dispose();
    courseImgController.dispose();
    courseLinkController.dispose();

    super.dispose();
  }

  clearText() {
    courseNameController.clear();
    courseDurationController.clear();
    coursePriceController.clear();
    courseImgController.clear();
    courseLinkController.clear();
  }

  displayMessage(message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
    Navigator.pop(context);
  }

  Future<void> addCourse(
      courseName, courseDuration, coursePrice, courseImg, courseLink) async {
    final data = await DbHelper.addCourse(
        courseName, courseDuration, coursePrice, courseImg, courseLink);
    displayMessage("course added");
    clearText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("add new Coursse"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "course Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                  ),
                  controller: courseNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "fadlan gali magaca coursada";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "course Duration",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                  ),
                  controller: courseDurationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "fadlan gali course Duration";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "course Price",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                  ),
                  controller: coursePriceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "fadlan gali course Price";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "course Img",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                  ),
                  controller: courseImgController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "fadlan course Img";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "course Link",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                  ),
                  controller: courseLinkController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "fadlan gali course Link ";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
