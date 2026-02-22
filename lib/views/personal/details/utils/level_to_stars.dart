int levelToStars(String level) {
  final lower = level.toLowerCase();
  if (lower == 'beginner' || lower == '1') return 1;
  if (lower == 'intermediate' || lower == '2') return 2;
  if (lower == 'advanced' || lower == '3') return 3;
  if (lower == 'expert' || lower == '4') return 4;
  if (lower == '5') return 5;
  final parsed = int.tryParse(level);
  if (parsed != null && parsed >= 1 && parsed <= 5) return parsed;
  return 0;
}
