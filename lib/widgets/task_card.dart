import "package:flutter/material.dart";
import "package:potatotimer/widgets/index.dart";

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        height: 196,
        width: double.maxFinite,
        decoration: ShapeDecoration(
          shadows: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          color: const Color(0xffFBFCFE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
                padding: EdgeInsets.fromLTRB(25.0, 20, 25, 10),
                child: TaskFinishedHeader()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Task 1",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xff216C2E),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "This is what needs to be done and how it can be done in time",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xff006782),
                    ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffE1DFFF),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                height: 40,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "MARK COMPLETE",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
