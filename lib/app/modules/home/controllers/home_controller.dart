import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/network/firebase_connect.dart';

class HomeController extends GetxController {

  Stream<QuerySnapshot<Object?>>? taskStream ;

  @override
  void onInit() {
    debugPrint(FirebaseConnection().getUserId());

    getTaskStream();
    super.onInit();
  }

  getTaskStream(){
    taskStream = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseConnection().getUserId())
      .collection("Tasks").orderBy("created_at", descending:true)
      .snapshots();
  }

  deleteTask(taskId)async{
    await FirebaseConnection().deleteTask(taskId);
  }
}
