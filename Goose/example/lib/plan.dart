import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:developer' as developer;
import 'resBuilder.dart';

Future<List<ScoreboardListBuilder>> main() async{
  List<ScoreboardListBuilder> scoreboardLists;
  ScoreboardListBuilder scoreboardList;

  String getToday(){
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    String strToday = formatter.format(now);
    return strToday;
  }

  String urlGetToday = "https://sports.news.naver.com/wbaseball/schedule/scoreboard?year=2022&month=06&category=mlb&date="+getToday();

  var url = urlGetToday;
  var response = await http.get(Uri.parse(url));
  var res = utf8.decode(response.bodyBytes);
  var jsonBody = jsonDecode(res)['scoreboardList'];

  scoreboardLists = List.empty(growable :true);
  for (int i=0; i < jsonBody.length; i++){
    scoreboardList = ScoreboardListBuilder.fromjson(jsonBody[i]);
    scoreboardLists.add(scoreboardList);
  }
  return scoreboardLists;
}