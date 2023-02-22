class Habit {
  final String name;
  final int times;
  final DateTime startedAt;

  const Habit(this.name, this.times, this.startedAt);

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return other is Habit && other.name == name;
  }
}