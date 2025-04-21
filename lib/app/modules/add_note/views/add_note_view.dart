import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moor_db/app/data/db/note_db.dart';
import 'package:moor_db/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  final HomeController homeC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ADD NOTE'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.descriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            Obx(
              () => ElevatedButton(
                  onPressed: () async {
                    if (controller.isLoading.isFalse) {
                      controller.isLoading.value = true;
                      await homeC.NoteM.insertNote(Note(title: controller.titleController.text, desc: controller.descriptionController.text));
                      controller.isLoading.value = false;
                      Get.back();
                    }
                  },
                  child: Text(
                      (controller.isLoading.isFalse) ? 'ADD NOTE' : "LOADING")),
            )
          ],
        ));
  }
}
