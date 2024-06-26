import 'package:flutter/material.dart';
import 'package:task_tracker_app_ui/utils/app_font.dart';

class LongTasksList extends StatelessWidget {
  final String taskName;
  final String taskTime;
  final String imageAsset;
  final Color taskColor;
  const LongTasksList({super.key, required this.taskName, required this.taskTime, required this.imageAsset, required this.taskColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration:   BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: taskColor,
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
                Text(taskName, style: AppFont.medium().copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text(taskTime, style: AppFont.medium().copyWith(color: Colors.black.withOpacity(0.6)),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: taskName,
              child: Image.asset(imageAsset)),
          )
        ],
      ),
    );
  }
}
