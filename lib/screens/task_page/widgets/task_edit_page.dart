import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/custom_button.dart';
import 'package:todo_app/common/custom_text_field.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/home/home_view.dart';
import 'package:todo_app/screens/stateful_wrapper.dart';
import 'package:todo_app/screens/task_page/task_page_viewmodel.dart';

class TaskEditPage extends StatelessWidget {
  final Todo todo;
  final TaskPageViewmodel viewmodel;
  const TaskEditPage({Key? key, required this.todo, required this.viewmodel})
      : super(key: key);

  onInit() {
    viewmodel.titleController.text = todo.title;
    viewmodel.descriptionController.text = todo.description;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return StatefulWrapper(
      onInit: onInit,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Form(
              key: viewmodel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit",
                    style: theme.textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Edit your tasks!",
                    style: theme.textTheme.bodyText2,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Title",
                    style: theme.textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hintText: 'Add Title',
                    controller: viewmodel.titleController,
                    textInputAction: TextInputAction.next,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Title is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Description",
                    style: theme.textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    number: 5,
                    hintText: 'Add Description',
                    controller: viewmodel.descriptionController,
                    textInputAction: TextInputAction.done,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Description is required';
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomButton(
                      buttonText: "Update",
                      buttonColor: theme.colorScheme.primary,
                      onPressed: () async {
                        if (viewmodel.formKey.currentState!.validate()) {
                          viewmodel.isLoading = true;
                          var res = await viewmodel.updateTasks(todo);
                          if (res.success) {
                            Get.to(
                              () => const HomeView(),
                              preventDuplicates: false,
                            );
                          }
                        }
                      },
                      textStyle: theme.textTheme.button,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
