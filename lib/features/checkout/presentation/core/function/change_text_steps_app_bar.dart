String changeTextStepsAppBar({required int step}) {
  switch (step) {
    case 0:
      return "الشحن";
    case 1:
      return "العنوان";
    case 2:
    case 3:
      return "الدفع";
    default:
      return "unKnown";
  }
}
