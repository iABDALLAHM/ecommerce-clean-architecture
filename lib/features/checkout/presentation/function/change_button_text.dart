String changeButtonText({required int currentPage}) {
  switch (currentPage) {
    case 0 && 1:
      return "التالي";
    case 2:
      return "الدفع بواسطة paypal";
    default:
      return "التالي";
  }
}