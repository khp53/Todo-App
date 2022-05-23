import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/common/custom_text_field.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

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
                "Search",
                style: theme.textTheme.headline2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Looking for something specific?",
                style: theme.textTheme.bodyText2,
              ),
              const SizedBox(height: 50),
              CustomTextFormField(
                hintText: "Search",
                iconData2: Icon(
                  Icons.search,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
