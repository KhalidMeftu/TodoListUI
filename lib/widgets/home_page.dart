import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:task_tracker_app_ui/model/day_date_model.dart';
import 'package:task_tracker_app_ui/model/long_list_model.dart';
import 'package:task_tracker_app_ui/model/task_model.dart';
import 'package:task_tracker_app_ui/utils/app_colors.dart';
import 'package:task_tracker_app_ui/utils/app_font.dart';
import 'package:task_tracker_app_ui/utils/app_resources.dart';
import 'package:task_tracker_app_ui/utils/app_string.dart';
import 'package:task_tracker_app_ui/utils/custom_path.dart';
import 'package:task_tracker_app_ui/widgets/common/days_display_card.dart';
import 'package:task_tracker_app_ui/widgets/common/task_list_card.dart';

import 'common/task_card.dart';
import 'details_page.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskModel> userTask = [];
  List<DayDateModel> userDayDates = [];
  List<LongListModel> taksList = [];
  double screenWidth=0.0;
  bool startAnimating=false;

  int _focusedIndex = 0;
  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }


  @override
  void initState() {
    super.initState();
    addUserTasks();
    addDatesDays();
    addLongListData();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimating = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                  height: MediaQuery.of(context).size.height / 2.2,
                ),
              ),
              const Positioned(
                top: 20,
                left: 20,
                child: Icon(Icons.menu, size: 30, color: AppColors.blackColor),
              ),

              /// hello khalid
              Positioned(
                top: 60,
                left: 20,
                child: Text(AppString.helloKhalid,
                    style: AppFont.medium()
                        .copyWith(color: AppColors.blackColor, fontWeight: FontWeight.bold)),
              ),

              /// tasks
              Positioned(
                top: 90,
                left: 20,
                child: Text(AppString.todayTasks,
                    style: AppFont.small().copyWith(color: AppColors.blackColor)),
              ),

              /// profile image
              Positioned(
                top: 50,
                right: 20,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.yellowColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(AppResources.user),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              /// cards
              Positioned(
                top: 160,
                left: 10,
                right: 0,
                bottom: 0,
                child: Column(
                  children: [
                    Expanded(
                      child: ScrollSnapList(
                        itemSize: 150,
                        dynamicItemSize: true,
                        itemCount: userTask.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TaskDetailsPage(
                                      index: index,
                                        taskName: userTask[index].taskName,
                                        taskTime: userTask[index].taskTime,
                                        imageURL: userTask[index].taskImage,
                                        taskTimeLeft: '',
                                        taskBgColor: userTask[index].taskColor),
                                  ),
                                );
                              },
                              child: TasksCard(
                                taskColor: userTask[index].taskColor,
                                taskImage: userTask[index].taskImage,
                                taskName: userTask[index].taskName,
                                taskTime: userTask[index].taskTime,
                                index: index,
                              ),
                            ),
                          );
                        },
                        onItemFocus: _onItemFocus,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 8.0, top: 10.0),
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: userDayDates.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: DaysDisplayWidget(
                        date: userDayDates[index].dateName,
                        day: userDayDates[index].dayName),
                  );
                },
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 8.0, top: 20.0),
                child: Text(AppString.allTasks,
                    style: AppFont.medium().copyWith(fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0, top: 20.0),
                child: Icon(Icons.event_note, color: AppColors.blackColor),
              )
            ],
          ),
          Flexible(
            fit: FlexFit.tight,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: taksList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TaskDetailsPage(
                            index: index,
                              taskName: taksList[index].taskName,
                              taskTime: taksList[index].taskTime,
                              imageURL: taksList[index].imageURL,
                              taskTimeLeft: '',
                              taskBgColor: taksList[index].taskColor),
                        ),
                      );
                    },
                    child: AnimatedContainer(
                      width: screenWidth,
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 600 + (index * 400)),
                      transform: Matrix4.translationValues(startAnimating? 0 : screenWidth, 0, 0),
                      child: LongTasksList(
                          taskName: taksList[index].taskName,
                          taskTime: taksList[index].taskTime,
                          imageAsset: taksList[index].imageURL,
                          taskColor: taksList[index].taskColor),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addUserTasks() {
    TaskModel userTask1 = TaskModel(
      taskName: AppString.cycling,
      taskColor: AppColors.firstColor,
      taskImage: AppResources.cycle,
      taskTime: '10:00 AM',
    );
    userTask.add(userTask1);

    TaskModel userTask2 = TaskModel(
      taskName: AppString.fishing,
      taskColor: AppColors.secondColor,
      taskImage: AppResources.fishing,
      taskTime: '2:30 PM',
    );
    userTask.add(userTask2);

    TaskModel userTask3 = TaskModel(
      taskName: AppString.running,
      taskColor: AppColors.thirdColor,
      taskImage: AppResources.running,
      taskTime: '4:00 PM',
    );
    userTask.add(userTask3);

    TaskModel userTask4 = TaskModel(
      taskName: AppString.swimming,
      taskColor: AppColors.fourthColor,
      taskImage: AppResources.swimming,
      taskTime: '6:30 PM',
    );
    userTask.add(userTask4);

    TaskModel userTask5 = TaskModel(
      taskName: AppString.reading,
      taskColor: AppColors.fivithColor,
      taskImage: AppResources.reading,
      taskTime: '9:00 PM',
    );
    userTask.add(userTask5);
  }

  void addDatesDays() {
    DayDateModel dayOne = DayDateModel(dateName: AppString.sun, dayName: "01");
    DayDateModel dayTwo = DayDateModel(dateName: AppString.mon, dayName: "02");
    DayDateModel dayThree = DayDateModel(dateName: AppString.tue, dayName: "03");
    DayDateModel dayFour = DayDateModel(dateName: AppString.wen, dayName: "04");
    DayDateModel dayFive = DayDateModel(dateName: AppString.thru, dayName: "05");
    userDayDates.add(dayOne);
    userDayDates.add(dayTwo);
    userDayDates.add(dayThree);
    userDayDates.add(dayFour);
    userDayDates.add(dayFive);
  }

  void addLongListData() {
    LongListModel taskOne = LongListModel(
        taskName: AppString.sleeping,
        taskTime: "08:00-7:00",
        imageURL: AppResources.sleep,
        taskColor: Colors.green.withOpacity(0.5));
    LongListModel taskTwo = LongListModel(
        taskName: AppString.reading,
        taskTime: "12:00-4:00",
        imageURL: AppResources.read,
        taskColor: Colors.redAccent.withOpacity(0.5));
    LongListModel taskThree = LongListModel(
        taskName: AppString.playMobileGame,
        taskTime: "4:05-4:50",
        imageURL: AppResources.game,
        taskColor: Colors.amber.withOpacity(0.5));
    LongListModel taskFour = LongListModel(
        taskName: AppString.walk,
        taskTime: "5:00-6:00",
        imageURL: AppResources.walk,
        taskColor: Colors.black12.withOpacity(0.5));

    taksList.add(taskOne);
    taksList.add(taskTwo);
    taksList.add(taskThree);
    taksList.add(taskFour);






  }
}

