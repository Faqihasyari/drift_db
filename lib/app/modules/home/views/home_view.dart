import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moor_db/app/data/db/note_db.dart';
import 'package:moor_db/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  NoteDb NoteM = NoteDb();
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Note>>(
          stream: NoteM.streamNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data?.length == 0 || snapshot.data == 0) {
              return Center(
                child: Text("No Notes"),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Note note = snapshot.data![index];
                return ListTile(
                  onTap: () => Get.toNamed(Routes.EDIT_NOTE, arguments: note),
                  leading: CircleAvatar(
                    child: Text('${note.id}'),
                  ),
                  trailing:
                      IconButton(onPressed: () => NoteM.deleteNote(note), icon: Icon(Icons.delete)),
                  title: Text("Title ${note.title}"),
                  subtitle: Text("Desc ${note.desc}"),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_NOTE, arguments: NoteM),
        child: Icon(Icons.add),
      ),
    );
  }
}
