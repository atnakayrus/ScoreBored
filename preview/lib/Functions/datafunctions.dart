class HiveFunctions {
  String allPlayers(List data) {
    String players = '';
    int len = data.length;
    for (int i = 0; i < len; i++) {
      players += data[i][0] + ' ';
    }
    return (players);
  }

  String scoreHistory(List data) {
    String players = ' ';
    int len = data.length;
    for (int i = 0; i < len; i++) {
      players += '${data[i]} + ';
    }
    return (players);
  }

  List newScoreBoards(int len) {
    String s = 'Player ';
    List list = [];
    for (int i = 0; i < len; i++) {
      list.add(['$s $i', 0]);
    }
    return (list);
  }

  String dateFormatter(DateTime date) {
    String dateFormat, s;
    int m = date.minute;
    s = (m < 10) ? '0$m' : '$m';
    dateFormat = 'Time: ${date.hour}:$s Date:${date.day}/${date.month}';
    return dateFormat;
  }
}
