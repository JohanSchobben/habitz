List<String> _months = [
  "januari",
  "februari",
  "maart",
  "april",
  "mei",
  "juni",
  "juli",
  "augustus",
  "september",
  "oktober",
  "november",
  "december"
];

extension DateExtensions on DateTime {
  String get monthText => _months[month-1];
}