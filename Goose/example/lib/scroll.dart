import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'resBuilder.dart';
import 'plan.dart' as plan2;
import 'package:flutter/foundation.dart';
import 'dart:core';
import 'package:example/pages/create_event_page.dart';
import 'package:example/widgets/month_view_widget.dart';

List<ScoreboardListBuilder> scoreboardList = [];

class PushingData {
  String? pushhomeTeamName;
  String? pushawayTeamName;
  String? pushGamestartday;
  String? pushGameendday;
  String? pushGamestartTime;
  String? pushGameendTime;
  String? desciption;

  PushingData(
      this.pushhomeTeamName,
      this.pushawayTeamName,
      this.pushGamestartday,
      this.pushGameendday,
      this.pushGamestartTime,
      this.pushGameendTime,
      this.desciption);
}

Future<List<ScoreboardListBuilder>> scroll() async {
  scoreboardList = await plan2.main();

  for (int i = 0; i < scoreboardList.length; i++) {
    var target = scoreboardList[i];

    if (target.gameStartDate != null && target.gameStartTime != null) {
      var year = target.gameStartDate?.substring(0, 4);
      var month = target.gameStartDate?.substring(5, 7);
      var day = target.gameStartDate?.substring(8, 10);
      var hours = target.gameStartTime?.substring(0, 2);
      var minutes = target.gameStartTime?.substring(3, 5);

      target.setStartDateYear(year!);
      target.setStartDateMonth(month!);
      target.setStartDateDay(day!);
      target.setStartTimeHours(hours!);
      target.setStartTimeMinute(minutes!);
    }
  }

  return scoreboardList;
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var imageList = [
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png',
    'image/mlbleague.png'
  ];

  void showPopup(context, title, title2, image, date, time) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 380,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontFamily: 'Gamja_Flower',
                  ),
                ),
                Text(
                  title2,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontFamily: 'Gamja_Flower',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    date,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                      fontFamily: 'Gamja_Flower',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    time,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                      fontFamily: 'Gamja_Flower',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  label: const Text('close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.6;

    return FutureBuilder(
        future: scroll(),
        initialData: <ScoreboardListBuilder>[],
        builder: (BuildContext context,
            AsyncSnapshot<List<ScoreboardListBuilder>> data) {
          return Scaffold(
              // appBar: AppBar(
              //   title: const Text(
              //     '경기 일정',
              //     style: TextStyle(color: Colors.grey),
              //   ),
              //   backgroundColor: Colors.white,
              //   elevation: 0,
              // ),
              body: ListView.builder(
                  itemCount: scoreboardList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          debugPrint(scoreboardList[index].homeTeamName);
                          showPopup(
                              context,
                              scoreboardList[index].homeTeamName,
                              scoreboardList[index].awayTeamName,
                              imageList[index],
                              scoreboardList[index].gameStartDate,
                              scoreboardList[index].gameStartTime);
                        },
                        child: Card(
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: Image.asset(imageList[index])),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                        child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                  scoreboardList[index]
                                                      .homeTeamName!,
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.blueAccent,
                                                    fontFamily: 'Gamja_Flower',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                flex: 1),
                                            Text("vs",
                                                style: const TextStyle(
                                                    fontSize: 40,
                                                    fontFamily: 'Gamja_Flower',
                                                    color:
                                                        Colors.orangeAccent)),
                                            Expanded(
                                                child: Text(
                                                  scoreboardList[index]
                                                      .awayTeamName!,
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.blue,
                                                    fontFamily: 'Gamja_Flower',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                flex: 1)
                                          ],
                                        ),
                                        SizedBox(
                                          width: width,
                                          child: Text(
                                            scoreboardList[index]
                                                .gameStartDate!,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[500],
                                              fontFamily: 'Gamja_Flower',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                            width: width,
                                            child: Text(
                                              scoreboardList[index]
                                                  .gameStartTime!,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Gamja_Flower',
                                                  color: Colors.grey[500]),
                                              textAlign: TextAlign.center,
                                            ))
                                      ],
                                    ))),
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        final pushingData = PushingData(
                                            scoreboardList[index].homeTeamName,
                                            scoreboardList[index].awayTeamName,
                                            scoreboardList[index].gameStartDate,
                                            scoreboardList[index].gameEndDate,
                                            scoreboardList[index].gameStartTime,
                                            scoreboardList[index].gameStartTime,
                                            scoreboardList[index].categoryName);
                                        final result = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateEventPage(
                                                      pushingData:
                                                          pushingData)),
                                        );
                                      },
                                      child: Text('갱신',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Gamja_Flower',
                                              color: Colors.white)),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.orangeAccent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          elevation: 0.0)

                                      // style: ButtonStyle(
                                      //   backgroundColor: MaterialStateProperty.all((Colors.deepOrangeAccent)),
                                      //   padding: MaterialStateProperty.all(
                                      //     EdgeInsets.all(50.10),

                                      ),
                                )
                              ],
                            ),
                          ),
                        ));
                  }));
        });
  }
}
