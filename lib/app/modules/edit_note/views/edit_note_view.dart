import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moor_db/app/data/db/note_db.dart';
import 'package:moor_db/app/modules/home/controllers/home_controller.dart';

import '../controllers/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  final HomeController homeC = Get.find();
  Note note = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.titleController.text = note.title;
    controller.descriptionController.text = note.desc;

    return Scaffold(
        appBar: AppBar(
          title: Text('EditNoteView'),
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
                      await homeC.NoteM.updateNote(Note(
                          id: note.id,
                          title: controller.titleController.text,
                          desc: controller.descriptionController.text));
                      controller.isLoading.value = false;
                      Get.back();
                    }
                  },
                  child: Text((controller.isLoading.isFalse)
                      ? 'EDIT NOTE'
                      : "LOADING")),
            )
          ],
        ));
  }
}
