import "package:flutter/material.dart";
import "package:potatotimer/widgets/index.dart";

class NewTaskDialog extends StatelessWidget {
  const NewTaskDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xffFBFCFE),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Add Task",
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              const SizedBox(height: 15),
              const CustomTextField(title: "Title"),
              const SizedBox(height: 30),
              const CustomTextField(
                title: "Description",
                maxLines: 5,
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SetTaskDuration(),
              ),
              const SizedBox(height: 80),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffE1DFFF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  height: 61,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Add Task",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
