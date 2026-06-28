String changeButtonText({required int currentPage}) {
  switch (currentPage) {
    case 0:
    case 1:
      return "التالي";
    case 2:
      return "تأكيد & استمرار";
    case 3:
      return "تأكيد الطلب";
    default:
      return "";
  }
}
