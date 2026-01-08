String changeTextSteps({required int step}) {
  switch (step) {
    case 0:
      return "الشحن";
    case 1:
      return "العنوان";
    case 2:
      return "الدفع";
    default:
      return "unKnown";
  }
}
