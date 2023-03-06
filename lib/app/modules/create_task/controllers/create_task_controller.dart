import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/network/firebase_connect.dart';

class CreateTaskController extends GetxController {
  final titleController = TextEditingController(),
      descriptionController = TextEditingController(),
      deadlineController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final updateTask = false.obs;
  final updateTaskId = "".obs;

  @override
  void onInit() {
    var data = Get.arguments;
    if (data != null || (data?.length ?? -1) != 0) {
      updateTask.value = data?[0]["update_task"] ?? false;
      updateTaskId.value = data?[0]["update_task_id"] ?? "";

      titleController.text = data?[0]["update_title"] ?? "";
      descriptionController.text = data?[0]["update_description"] ?? "";
      deadlineController.text = data?[0]["update_deadline"] ?? "";
    }
    super.onInit();
  }

  handleDeadline(context1) async {
    DateTime? pickedDateTime = await DatePicker.showDateTimePicker(
      Get.context!,
      showTitleActions: true,
      minTime: DateTime(1980),
      maxTime: DateTime(2100),
      onChanged: (date) {},
    );
    if (pickedDateTime != null) {
      deadlineController.text = pickedDateTime.toString();
    }
  }

final pressed = false.obs;

handleCreateTask({title, description, deadline}) async {

  if(!pressed.value) {
    pressed.value = true;
    if (formKey.currentState!.validate()) {
      bool? createdTask = await FirebaseConnection().createTask(
        title: titleController.text,
        description: descriptionController.text,
        deadline: deadlineController.text,
      );
      if (createdTask ?? false) {
        Get.back();
      }
    }
  }else{
    debugPrint("Creating task. Please wait");
    //  show toast message can be a option
  }
}

handleUpdateTask({title, description, deadline}) async {
  if(!pressed.value){
    pressed.value = true;
    if (formKey.currentState!.validate()) {
      bool? updatedTask = await FirebaseConnection().updateTask(
        updateTaskId.value,
        title: titleController.text,
        description: descriptionController.text,
        deadline: deadlineController.text,
      );
      if (updatedTask ?? false) {
        Get.back();
      }
      else{
        pressed.value = false;
      }
    }
  } else{
    debugPrint("Updating task. Please wait");
    //  show toast message can be a option
  }
}
  
  
}
