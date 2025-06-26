/// Holds all the image URLs loaded from remote config or fallback to local assets
class AppImages {
  const AppImages({
    required this.backgroundImageUrl,
    required this.profileImageUrl,
  });

  factory AppImages.withFallbacks({
    String? backgroundImageUrl,
    String? profileImageUrl,
  }) {
    return AppImages(
      backgroundImageUrl: backgroundImageUrl ?? '',
      profileImageUrl: profileImageUrl ?? '',
    );
  }

  final String backgroundImageUrl;
  final String profileImageUrl;

  AppImages copyWith({
    String? backgroundImageUrl,
    String? profileImageUrl,
  }) {
    return AppImages(
      backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
