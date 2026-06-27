
  String handleExpirationYearsText({required int numOfYears}) {
    switch (numOfYears) {
      case 1:
        return "عام";
      case 2:
        return "عامين";
      case 3:
        return "3 اعوام";
      case 4:
        return "4 اعوام";
      default:
        return "";
    }
  }