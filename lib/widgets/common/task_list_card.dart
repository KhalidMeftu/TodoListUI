import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_tracker_app_ui/utils/app_font.dart';

class TasksCard extends StatelessWidget {
  final String taskImage;
  final String taskName;
  final String taskTime;
  final Color taskColor;
  final int index;
  const TasksCard({super.key, required this.taskImage,
    required this.taskName,  required this.taskTime,
    required this.taskColor, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 230,
      child: Card(
        color: taskColor,//.withOpacity(0.9),
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(70),
              bottomRight: Radius.circular(15))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: index.toString(),
                      child: SvgPicture.asset(
                      taskImage,
                        height: 60,
                        width: 60,
                                   ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(taskName, style: AppFont.large().copyWith(color: Colors.black, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(taskTime, style: AppFont.medium().copyWith(color:Colors.black),),
            ),

           ],
        ),
      ),
    );
  }
}
