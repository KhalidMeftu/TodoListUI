import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_tracker_app_ui/utils/app_colors.dart';
import 'package:task_tracker_app_ui/utils/app_resources.dart';
import 'package:task_tracker_app_ui/utils/custom_path.dart';
import 'package:task_tracker_app_ui/widgets/common/task_card.dart';
import 'package:task_tracker_app_ui/widgets/common/task_history_ui.dart';
import '../utils/app_font.dart';
import 'home_page.dart';

class TaskDetailsPage extends StatelessWidget {
  final String taskName;
  final String taskTime;
  final String imageURL;
  final String taskTimeLeft;
  final Color taskBgColor;
  final int index;

  const TaskDetailsPage(
      {super.key,
      required this.taskName,
      required this.taskTime,
      required this.imageURL,
      required this.taskTimeLeft,
      required this.taskBgColor, required this.index});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent, // Make the status bar transparent
    ),
    child:
    Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: AppColors.buttonGradient,
                    ),
                    height: MediaQuery.of(context).size.height / 2.2 + statusBarHeight,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 25,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.black,
                      )),
                ),

                Positioned(
                    top: 80,
                    left: 20,
                    right: 20,
                    bottom: 0,
                    child:
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(height: 200, width: 200),
                      child: Container(
                        decoration: BoxDecoration(
                          color: taskBgColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Hero(
                          tag: index,
                          child: Center(
                            child:  imageURL.contains(".svg")? SvgPicture.asset(
                              imageURL,
                              height: 100,
                              width: 100,
                            ):Image.asset(imageURL),
                          ),
                        ),
                      ),
                    ))
              ],
            ),



            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(taskName, style: AppFont.large()),
            ),
            Text(taskTime, style: AppFont.medium()),

            Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0,top: 10.0,),
              child: LongTasksList(
                taskName: "Start In", taskTime: "00:05:05", imageAsset: AppResources.arrowNext, taskColor: taskBgColor,
               ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 8.0,top: 10.0),
                    child: Text(
                      "Activity History",
                      style: AppFont.medium().copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5.0, top: 10.0),
                    child: Icon(
                      Icons.event_note,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
        height: 10,
            ),
            Flexible(
        child: ListView(

            children: const [
         Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0,top: 10.0,),
              child: ActivityListTasks(taskDate: 'Monday, March 10',taskTime: '08:00', taskNote: 'Heavy Excercise',),
              ),

               Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0,top: 10.0,),
              child: ActivityListTasks(taskDate: 'Monday, March 14',taskTime: '09:00', taskNote: 'Good Excercise',),
              ),
               Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0,top: 10.0,),
              child: ActivityListTasks(taskDate: 'Monday, March 10',taskTime: '08:00', taskNote: 'Heavy Excercise',),
              ),

            ],
        ),
            ),
            SizedBox(
        height: 10,
            )


          ],
        ),
      ));
  }
}
