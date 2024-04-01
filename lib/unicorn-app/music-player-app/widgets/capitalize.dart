String capitalizeEachWord(String input) {
  if (input.contains('&quot;')){
    input = input.replaceAll('&quot;', '"');
  }
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
