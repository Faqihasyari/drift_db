import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moor_db/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Get.toNamed(Routes.EDIT_NOTE, arguments: index + 1 ),
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            title: Text("Title ${index + 1}"),
            subtitle: Text("Desc ${index + 1}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_NOTE),
        child: Icon(Icons.add),
      ),
    );
  }
}
