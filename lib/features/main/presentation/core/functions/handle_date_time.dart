String handleDateTime({required DateTime date}) {
  int hour = date.hour;
  String preiod = (date.hour < 12) ? "صباحا" : "مساء";

  return "$hour $preiod";
}
