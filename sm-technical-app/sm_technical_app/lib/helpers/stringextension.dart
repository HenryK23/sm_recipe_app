extension StringExtension on String {
  String get getRecipeId {
    return substring(lastIndexOf('_'));
  }
}
