import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moor_db/app/data/db/note_db.dart';

class AddNoteController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  
}
