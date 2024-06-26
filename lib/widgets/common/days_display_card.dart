import 'package:flutter/material.dart';
import 'package:task_tracker_app_ui/utils/app_font.dart';

class DaysDisplayWidget extends StatelessWidget {
  final String date;
  final String day;
  const DaysDisplayWidget({super.key, required this.date, required this.day});

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        width: 70,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.0)
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(date, style: AppFont.medium()),
        const SizedBox(height: 2,),
        Text(day, style: AppFont.medium().copyWith(fontWeight: FontWeight.bold),),

      ],),
      ),
    );
  }
}