class ScoreboardListBuilder {
  final String? homeTeamName;
  final String? awayTeamName;
  final String? homeTeamScore;
  final String? awayTeamScore;
  final String? homeTeamEmblem64URI;
  final String? awayTeamEmblem64URI;
  final String? homeTeamEmblem25URI;
  final String? awayTeamEmblem25URI;
  final String? homeTeamEmblem30URI;
  final String? awayTeamEmblem30URI;
  final String? gameId;
  final String? categoryId;
  final String? categoryName;
  final String? gameStartDate;
  final String? gameStartTime;
  final String? gameEndDate;
  final String? gameEndTime;
  final String? gameRelayDateTime;
  final String? stadium;
  final String? state;
  final String? textRelayURI;
  final String? tvRelayURI;
  final String? videoCenterURI;
  final String? title;
  final bool onAirTv;
  final bool onAirText;
  final bool scheduledTv;
  final bool homeTeamWon;
  final bool awayTeamWon;
  final bool providedVod;
  final String? gameStatus;
  final String? gameContent;
  final String? leagueName;
  final String? leagueShortName;
  final String? groupName;
  final String? homeTeamCode;
  final String? awayTeamCode;
  final String? phaseName;
  final String? pkHomeScore;
  final String? pkAwayScore;
  final String? tournamentGameText;
  final String? gameInfo;
  final bool reversedHomeAway;
  final String? suspendedInfo;
  final bool canceled;
  final bool suspended;
  final String? gameVideo;
  final String? liveSnapshotUrl;

  late String? startDateYear;
  late String? startDateMonth;
  late String? startDateDay;
  late String? startTimeHours;
  late String? startTimeMinute;

  ScoreboardListBuilder(this.awayTeamCode, this.homeTeamName, this.awayTeamName,
      this.homeTeamScore, this.awayTeamScore, this.homeTeamEmblem64URI,
      this.awayTeamEmblem64URI, this.homeTeamEmblem25URI,
      this.awayTeamEmblem25URI, this.homeTeamEmblem30URI,
      this.awayTeamEmblem30URI, this.gameId, this.categoryId, this.categoryName,
      this.gameStartDate, this.gameStartTime,
      this.gameEndDate, this.gameRelayDateTime, this.stadium, this.state,
      this.textRelayURI, this.tvRelayURI, this.videoCenterURI, this.title,
      this.onAirTv, this.onAirText,
      this.scheduledTv, this.homeTeamWon, this.awayTeamWon, this.providedVod,
      this.gameStatus, this.gameContent, this.leagueName, this.leagueShortName,
      this.groupName,
      this.homeTeamCode, this.phaseName, this.pkHomeScore, this.pkAwayScore,
      this.tournamentGameText, this.gameInfo, this.reversedHomeAway,
      this.suspendedInfo, this.suspended,
      this.gameVideo, this.liveSnapshotUrl, this.canceled, this.startDateYear, this.startDateMonth, this.startDateDay,
          this.startTimeHours, this.startTimeMinute, this.gameEndTime);

  ScoreboardListBuilder.fromjson(Map<String, dynamic> json)
      : homeTeamName = json["homeTeamName"],
        videoCenterURI = json["videoCenterURI"],
        awayTeamName = json["awayTeamName"],
        homeTeamScore = json["homeTeamScore"],
        awayTeamScore = json["awayTeamScore"],
        homeTeamEmblem64URI = json["homeTeamEmblem64URI"],
        awayTeamEmblem64URI = json["awayTeamEmblem64URI"],
        homeTeamEmblem25URI = json["homeTeamEmblem25URI"],
        awayTeamEmblem25URI = json["awayTeamEmblem25URI"],
        homeTeamEmblem30URI = json["homeTeamEmblem30URI"],
        awayTeamEmblem30URI = json["awayTeamEmblem30URI"],
        gameId = json["gameId"],
        categoryId = json["categoryId"],
        categoryName = json["categoryName"],
        gameStartDate = json["gameStartDate"],
        gameStartTime = json["gameStartTime"],
        gameEndDate = json["gameEndDate"],
        gameEndTime = json["gameEndTime"],
        gameRelayDateTime = json["gameRelayDateTime"],
        stadium = json["stadium"],
        state = json["state"],
        textRelayURI = json["textRelayURI"],
        tvRelayURI = json["tvRelayURI"],
        title = json["title"],
        onAirTv = json["onAirTv"],
        onAirText = json["onAirText"],
        scheduledTv = json["scheduledTv"],
        homeTeamWon = json["homeTeamWon"],
        awayTeamWon = json["awayTeamWon"],
        providedVod = json["providedVod"],
        gameStatus = json["gameStatus"],
        gameContent = json["gameContent"],
        leagueName = json["leagueName"],
        leagueShortName = json["leagueShortName"],
        groupName = json["groupName"],
        homeTeamCode = json["homeTeamCode"],
        awayTeamCode = json["awayTeamCode"],
        phaseName = json["phaseName"],
        pkHomeScore = json["pkHomeScore"],
        pkAwayScore = json["pkAwayScore"],
        tournamentGameText = json["tournamentGameText"],
        gameInfo = json["gameInfo"],
        reversedHomeAway = json["reversedHomeAway"],
        suspendedInfo = json["suspendedInfo"],
        canceled = json["canceled"],
        suspended = json["suspended"],
        gameVideo = json["gameVideo"],
        liveSnapshotUrl = json["liveSnapshotUrl"];

  void setStartDateYear(String startDateYear){
    this.startDateYear = startDateYear;
  }

  void setStartDateMonth(String startDateMonth){
    this.startDateMonth = startDateMonth;
  }

  void setStartDateDay(String startDateDay){
    this.startDateDay = startDateDay;
  }

  void setStartTimeHours(String startTimeHours){
    this.startTimeHours = startTimeHours;
  }

  void setStartTimeMinute(String startTimeMinute){
    this.startTimeMinute = startTimeMinute;
  }
}
//
// class Pushdata {
//   String title;
//   String leagueId;
//   DateTime startDate;
//   DateTime endDate;
//   DateTime startTime;
//   DateTime endTime;
//   String description;
//
//   Pushdata(this.title, this.description, this.endDate, this.endTime, this.leagueId, this.startDate, this.startTime);
// }