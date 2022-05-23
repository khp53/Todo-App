import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/custom_button.dart';
import 'package:todo_app/common/list_title_deco.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/home/home_view.dart';
import 'package:todo_app/screens/task_page/task_page_viewmodel.dart';
import 'package:todo_app/screens/task_page/widgets/task_edit_page.dart';

class TaskDetailsPage extends StatelessWidget {
  final Todo todo;
  final TaskPageViewmodel viewmodel;
  const TaskDetailsPage({Key? key, required this.todo, required this.viewmodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Details",
                style: theme.textTheme.headline2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Your task details!",
                style: theme.textTheme.bodyText2,
              ),
              const SizedBox(height: 50),
              Text(
                "Title",
                style: theme.textTheme.subtitle1,
              ),
              const SizedBox(
                height: 5,
              ),
              ListTileDeco(
                child: ListTile(
                  title: Text(
                    todo.title,
                    style: theme.textTheme.bodyText1,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Description",
                style: theme.textTheme.subtitle1,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListTileDeco(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      todo.description,
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    buttonText: "Edit",
                    buttonColor: theme.colorScheme.primary,
                    onPressed: () => Get.to(
                      () => TaskEditPage(
                        todo: todo,
                        viewmodel: viewmodel,
                      ),
                    ),
                    textStyle: theme.textTheme.button,
                  ),
                  CustomButton(
                    buttonText: "Delete",
                    buttonColor: theme.colorScheme.background,
                    onPressed: () async {
                      viewmodel.isLoading = true;
                      await todo.delete();
                      Get.to(
                        () => const HomeView(),
                      );
                    },
                    textStyle: theme.textTheme.button!.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
