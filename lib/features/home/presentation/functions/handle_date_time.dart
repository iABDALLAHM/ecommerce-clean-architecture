String handleDateTime({required DateTime date}) {
  int hour = date.hour;
  int minute = date.minute;
  String preiod = (date.hour < 12) ? "صباحا" : "مساء";

  return "$hour:$minute $preiod";
}
