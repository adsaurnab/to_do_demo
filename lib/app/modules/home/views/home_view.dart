import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/base/global/constants/app_colors.dart';
import 'package:todo_app/app/network/firebase_connect.dart';
import 'package:todo_app/app/routes/app_pages.dart';
import '../../../base/global/constants/constants.dart';
import '../../../base/global/widgets/app_elevated_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: AppColors.transparent,
        elevation: 0,
        toolbarHeight: 0,
        leading: Container(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/bg_bl.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: AppColors.backgroundColor.withOpacity(.8),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: pSymH20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: p(
                        top: 20.0,
                        left: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Hi, User",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColors.purpleColor),
                          ),
                          
                          PopupMenuButton<int>(
                            padding: p(),
                            shadowColor: AppColors.backgroundColor,
                            surfaceTintColor: AppColors.orangeColor,
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                height: 40,
                                textStyle: const TextStyle(color: Colors.white),
                                value: 1,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                    ),
                                    sbW(5),
                                    const Text("Sign Out")
                                  ],
                                ),
                              ),
                            ],
                            offset: const Offset(0, 60),
                            color: AppColors.primaryColor,
                            elevation: 2,
                            onSelected: (value) {
                              if (value == 1) {
                                FirebaseConnection().signOut();
                              }
                            },
                            child: Container(
                              width: 55,
                              height: 50,
                              padding: p8,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.6),
                                  shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/png/user.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sbH20(),

                    StreamBuilder<QuerySnapshot>(
                      stream: controller.taskStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return  SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 30,
                                  child: CircularProgressIndicator(),
                                )
                              ],
                            ),
                          );;
                        }
                        if(snapshot.data!.docs.isEmpty){
                          return  SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: Image.asset("assets/icon/icon.png")),
                                const Text(
                                  "No Tasks",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.purpleColor),
                                ),
                              ],
                            ),
                          );

                        }

                        return ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                String? taskId = document.id;
                                return todoCardWidget(
                                  context,
                                  taskId: taskId,
                                  title: data['title'],
                                  description: data['description'],
                                  deadline: data['deadline'],
                                );
                              })
                              .toList()
                              .cast(),
                        );
                      },
                    ),
                    sbH20(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.createTask);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  todoCardWidget(context, {taskId, title, description, deadline}) {
    return Container(
      padding: pSymV(5.0),
      child: Card(
        elevation: 0,
        shadowColor: Colors.black,
        color: AppColors.cardBackgroundColor.withOpacity(.5),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: p20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.purpleColor.withOpacity(.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sbH(5),
                Text(
                  deadline ?? "",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.purpleColor.withOpacity(.5),
                  ),
                ),
                sbH(10),
                Text(
                  description ?? "",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.purpleColor.withOpacity(.6),
                  ),
                ),
                sbH(10),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: AppElevatedButton(
                        text: "Edit",
                        onPressed: () {
                          Get.toNamed(Routes.createTask, arguments: [
                            {
                              "update_task_id": taskId,
                              "update_task": true,
                              "update_title": title,
                              "update_description": description,
                              "update_deadline": deadline,
                            }
                          ]);
                        },
                      ),
                    ),
                    sbW10(),
                    SizedBox(
                      width: 80,
                      child: AppElevatedButton(
                        text: "Delete",
                        onPressed: () {
                          controller.deleteTask(taskId);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
