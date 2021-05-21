import 'package:flutter/material.dart';
import 'package:language_learning_app/common_widgets/circular_percent_indicator.dart';
import 'package:language_learning_app/common_widgets/tasks.dart';
import 'package:language_learning_app/utils/common_utils.dart';

class CoursePage extends StatelessWidget {
  final double progress;
  final String percentage;

  CoursePage({this.progress, this.percentage});

  Stack buildScreen(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage("${path}page2-bg.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          children: [
            buildAppBar(context),
            buildTitle(),
            buildMilestone(),
            SizedBox(
              height: 10,
            ),
            buildTasks(context),
          ],
        ),
      ],
    );
  }

  Container buildAppBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            "Course",
            style: TextStyle(
              fontFamily: 'Karla',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.info,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Container buildTitle() {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Spanish",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Karla',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Begginer",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Karla',
                        color: Colors.orange,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
          CircularPercentIndicator(
            progress: progress,
            percentage: percentage,
            height: 80,
            width: 80,
            radius: 40,
          ),
        ],
      ),
    );
  }

  Container buildMilestone() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            child: Image.asset('${path}diamond.png'),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            height: 25,
            width: 25,
            child: Image.asset('${path}diamond.png'),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "2 Milestones",
            style: TextStyle(
              fontFamily: 'Karla',
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  buildTasks(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: [
            Tasks(
              title: "Basics",
              icon: Icons.chrome_reader_mode,
              taskCompleted: "4",
              color: Colors.orange,
            ),
            Tasks(
              title: "Occupations",
              icon: Icons.work,
              taskCompleted: "1",
              color: Colors.redAccent,
            ),
            Tasks(
              title: "Conversation",
              icon: Icons.message,
              taskCompleted: "3",
              color: Colors.blue,
            ),
            Tasks(
              title: "Places",
              icon: Icons.location_on,
              taskCompleted: "1",
              color: Colors.green,
            ),
            Tasks(
              title: "Family Members",
              icon: Icons.people,
              taskCompleted: "3",
              color: Colors.purple,
            ),
            Tasks(
              title: "Foods",
              icon: Icons.fastfood,
              taskCompleted: "2",
              color: Colors.blue[900],
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildScreen(context),
      ),
    );
  }
}
