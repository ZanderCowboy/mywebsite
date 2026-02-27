enum StarLevel {
  beginner('Beginner', 1),
  intermediate('Intermediate', 3),
  advanced('Advanced', 4),
  expert('Expert', 5),
  unknown('Unknown', 0);

  const StarLevel(this.description, this.value);

  final String description;
  final int value;
}
