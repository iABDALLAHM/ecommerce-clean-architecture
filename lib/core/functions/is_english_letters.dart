bool isEnglishLetters({required String text}) {
  return RegExp('[a-z]').hasMatch(text.trim());
}
