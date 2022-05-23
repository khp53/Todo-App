import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/list_title_deco.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/stateful_wrapper.dart';
import 'package:todo_app/screens/task_page/task_page_viewmodel.dart';
import 'package:todo_app/screens/task_page/widgets/task_details_page.dart';

class TaskPageBody extends StatelessWidget {
  final TaskPageViewmodel viewmodel;
  const TaskPageBody({Key? key, required this.viewmodel}) : super(key: key);

  Future<List<Todo>> getAllTasks() async {
    List<Todo> todos = await viewmodel.getAllTasks();
    return todos;
  }

  onInit() {
    getAllTasks().then((value) => viewmodel.todos = value);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return StatefulWrapper(
      onInit: onInit,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello!",
                style: theme.textTheme.headline2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "What's your plan today?",
                style: theme.textTheme.bodyText2,
              ),
              const SizedBox(height: 50),
              viewmodel.todos.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewmodel.todos.length,
                      itemBuilder: (context, index) {
                        return ListTileDeco(
                          child: ListTile(
                            onTap: () => Get.to(
                              () => TaskDetailsPage(
                                todo: viewmodel.todos[index],
                              ),
                            ),
                            title: Text(
                              viewmodel.todos[index].title,
                              style: theme.textTheme.bodyText1,
                            ),
                            trailing: Checkbox(
                              onChanged: (val) {},
                              value: false,
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
