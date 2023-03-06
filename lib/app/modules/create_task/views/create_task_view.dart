import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../base/global/constants/app_colors.dart';
import '../../../base/global/constants/constants.dart';
import '../../../base/global/widgets/app_elevated_button.dart';
import '../../../base/global/widgets/app_text_form_field.dart';
import '../controllers/create_task_controller.dart';

class CreateTaskView extends GetView<CreateTaskController> {
  const CreateTaskView({Key? key}) : super(key: key);
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
          title: Text(
            "${controller.updateTask.value ? "Update" : "Create"} Task",
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: AppColors.purpleColor,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          toolbarHeight: 65,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.purpleColor,
              size: 30,
            ),
          ),
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
            color: AppColors.backgroundColor.withOpacity(.9),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: pSymH20,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        sbH(20),
                        AppTextFormField(
                          controller: controller.titleController,
                          hintText: "Title",
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Please enter a title";
                            }
                            return null;
                          },
                        ),
                        sbH10(),
                        AppTextFormField(
                          controller: controller.descriptionController,
                          hintText: "Description",
                          minLines: 5,
                          maxLines: 5,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Please enter a Description";
                            }
                            return null;
                          },
                        ),
                        sbH10(),
                        AppTextFormField(
                          controller: controller.deadlineController,
                          hintText: "Deadline",
                          readOnly: true,
                          onTap: () {
                            controller.handleDeadline(context);
                          },
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Please select a deadline";
                            }
                            return null;
                          },
                        ),
                        sbH10(),
                        SizedBox(
                          width: 120,
                          height: 45,
                          child: AppElevatedButton(
                            text:
                                "${controller.updateTask.value ? "Update" : "Create"} task",
                            onPressed: controller.updateTask.value
                                ? controller.handleUpdateTask
                                : controller.handleCreateTask,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
