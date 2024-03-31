String capitalizeEachWord(String input) {
  return input
      .split(' ')
      .where((word) => word.isNotEmpty)
      .map((word) => word.capitalize())
      .join(' ');
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
