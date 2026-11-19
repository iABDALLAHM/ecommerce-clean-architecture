String getMonthInArabic({required int month}) {
  switch (month) {
    case 1:
      return "يناير";
    case 2:
      return "فبراير";
    case 3:
      return "مارس";
    case 4:
      return "ابريل";
    case 5:
      return "مايو";
    case 6:
      return "يونيو";
    case 7:
      return "يوليو";
    case 8:
      return "اغسطس";
    case 9:
      return "سبتمبر";
    case 10:
      return "اكتوبر";
    case 11:
      return "نوفمبر";
    case 12:
      return "ديسمبر";
    default:
      return "";
  }
}

String getMonthInEnglish({required int month}) {
  switch (month) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";
    case 3:
      return "Mar";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "Aug";
    case 9:
      return "Sep";
    case 10:
      return "Oct";
    case 11:
      return "Nov";
    case 12:
      return "Dec";
    default:
      return "";
  }
}
