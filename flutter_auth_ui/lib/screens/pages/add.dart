import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_auth_ui/screens/pages/addcaption_screen.dart';
import 'package:get/get.dart';
import 'dart:io';

class Add extends StatelessWidget {
  Add({Key? key}) : super(key: key);
  videoPick(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          addCaption_Screen(
              videoFile: File(video.path), videoPath: video.path)));
    } else {
      Get.snackbar(
          "Error In Selecting Video", "Please Choose A Different Video File");
    }
  }

  showDialogOpt(BuildContext context) {

    return showDialog(context: context, builder: (context) =>
        SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () => videoPick(ImageSource.gallery, context),
              child: Text("Gallery"),
            ),
            SimpleDialogOption(
              onPressed: () => videoPick(ImageSource.camera, context),
              child: Text("Camera"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close"),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF0E6),
      body: Center(
        // child: InkWell(
        //   // onTap: () => showDialogOpt(context),
        //   child: Container(
        //     width: 190,
        //     height: 50,
        //     decoration: BoxDecoration(
        //         color: Colors.black
        //     ),
        //     child: Center(
        //       child: Text("Add Video" , style: TextStyle(
        //           fontSize: 25,
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold
        //       ),),
        //     ),
        //   ),
        // ),
        child: ElevatedButton(
          onPressed: () => showDialogOpt(context), 
          child: Text("Add Geet"),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF946C0A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

