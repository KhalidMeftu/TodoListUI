import 'package:flutter/material.dart';
import 'package:task_tracker_app_ui/utils/app_font.dart';

class ActivityListTasks extends StatelessWidget {
  final String taskDate ;
  final String taskTime;
  final String  taskNote;
  const ActivityListTasks({super.key, required this.taskDate, required this.taskTime, required this.taskNote});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.all(Radius.circular(10)),
        color: Colors.grey.withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(taskDate, style: AppFont.medium().copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text(taskNote, style: AppFont.medium().copyWith(color: Colors.black.withOpacity(0.6)),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taskTime, style: AppFont.medium().copyWith(fontWeight: FontWeight.bold, fontSize: 15),),

          )
        ],
      ),
    );
  }
}
