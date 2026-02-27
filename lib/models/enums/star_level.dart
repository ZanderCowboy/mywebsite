enum StarLevel {
  beginner('Beginner', 1),
  intermediate('Intermediate', 2),
  advanced('Advanced', 3),
  expert('Expert', 4),
  master('Master', 5),
  unknown('Unknown', 0);

  const StarLevel(this.description, this.value);

  final String description;
  final int value;
}
