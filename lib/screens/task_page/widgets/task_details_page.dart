import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/common/custom_button.dart';
import 'package:todo_app/common/list_title_deco.dart';
import 'package:todo_app/model/todo.dart';

class TaskDetailsPage extends StatelessWidget {
  final Todo todo;
  const TaskDetailsPage({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
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
            const SizedBox(height: 25),
            Text(
              "Description",
              style: theme.textTheme.subtitle1,
            ),
            const SizedBox(
              height: 5,
            ),
            ListTileDeco(
              child: ListTile(
                title: Text(
                  todo.description,
                  style: theme.textTheme.bodyText1,
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
                  onPressed: () {},
                  textStyle: theme.textTheme.button,
                ),
                CustomButton(
                  buttonText: "Delete",
                  buttonColor: theme.colorScheme.background,
                  onPressed: () {},
                  textStyle: theme.textTheme.button!.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
