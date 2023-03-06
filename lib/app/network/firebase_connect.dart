import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/routes/app_pages.dart';

class FirebaseConnection {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future? signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      debugPrint(result.user?.uid ?? "");
      return result.user;
    } catch (e) {
      return null;
    }
  }

  getUserId() {
    return _auth.currentUser?.uid ?? "";
  }

  isLoggerIn() {
    bool loggedIn = false;
    (_auth.currentUser?.uid) != null ? loggedIn = true : loggedIn = false;
    return loggedIn;
  }

  Future? signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.auth);
    } catch (e) {
      return null;
    }
  }

  Future<bool?> createTask(
      {title = "", description = "", deadline = ""}) async {
    CollectionReference task = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseConnection().getUserId())
        .collection("Tasks");
    bool createdTask = false;
    await task.add({
      'title': title,
      'description': description,
      'deadline': deadline,
      "created_at": DateTime.now().millisecondsSinceEpoch,
      "updated_at": "",
      
    }).then((value) {
      debugPrint("Task Created");
      createdTask = true;
    }).catchError((error) {
      debugPrint("Failed to create task: $error");
      return null;
    });
    return createdTask;
  }

  Future<bool?> updateTask(taskId, {title, description, deadline}) async {
    CollectionReference task = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseConnection().getUserId())
        .collection("Tasks");

    bool updatedTask = false;

    await task.doc(taskId ?? "").update({
      'title': title,
      'description': description,
      'deadline': deadline,
      "updated_at": DateTime.now().millisecondsSinceEpoch,
    }).then((value) {
      debugPrint("Task Updated");
      updatedTask = true;
    }).catchError((error) {
      debugPrint("Failed to update task: $error");
      return null;
    });

    return updatedTask;
  }

  Future<bool?> deleteTask(taskId) async {
    CollectionReference task = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseConnection().getUserId())
        .collection("Tasks");

    bool deletedTask = false;

    await task.doc(taskId ?? "").delete().then((value) {
      debugPrint("Task Deleted");
      deletedTask = true;
    }).catchError((error) {
      debugPrint("Failed to delete task: $error");
      return null;
    });
    return deletedTask;
  }
}
